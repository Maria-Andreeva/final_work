class Animal:
    def __init__(self, name, birth_date):
        self.__name = name
        self.__birth_date = birth_date

    def get_name(self):
        return self.__name

    def get_birth_date(self):
        return self.__birth_date

    def get_info(self):
        return f"Name: {self.__name}, Birth Date: {self.__birth_date}"

class Pet(Animal):
    def __init__(self, name, birth_date, commands=None):
        super().__init__(name, birth_date)
        self.__commands = commands if commands else []

    def add_command(self, command):
        self.__commands.append(command)

    def get_commands(self):
        return ', '.join(self.__commands)

class Dog(Pet):
    def __init__(self, name, birth_date):
        super().__init__(name, birth_date)

class Cat(Pet):
    def __init__(self, name, birth_date):
        super().__init__(name, birth_date)

class Hamster(Pet):
    def __init__(self, name, birth_date):
        super().__init__(name, birth_date)

class Counter:
    def __init__(self):
        self.count = 0
        self.open = False

    def __enter__(self):
        self.open = True
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        self.open = False
        if exc_type is not None:
            print("Исключение было вызвано:", exc_value)
        return True

    def add(self):
        if not self.open:
            raise Exception("Counter должен использоваться в контекстном менеджере.")
        self.count += 1

    def get_count(self):
        return self.count

def add_animal():
    name = input("Введите имя животного: ")
    birth_date = input("Введите дату рождения животного (YYYY-MM-DD): ")

    animal_type = input("Введите тип животного (собака, кошка, хомяк): ").strip().lower()
    
    if animal_type == 'собака':
        return Dog(name, birth_date)
    elif animal_type == 'кошка':
        return Cat(name, birth_date)
    elif animal_type == 'хомяк':
        return Hamster(name, birth_date)
    else:
        print("Неизвестный тип животного!")
        return None

def menu():
    animals = []
    try:
        with Counter() as counter:
            while True:
                print("\nМеню:")
                print("1. Завести новое животное")
                print("2. Показать всех животных")
                print("3. Обучить животное новой команде")
                print("4. Показать команды животного")
                print("5. Выход")

                choice = input("Выберите пункт меню: ")

                if choice == '1':
                    animal = add_animal()
                    if animal:
                        animals.append(animal)
                        counter.add()
                        print(f"Животное '{animal.get_name()}' добавлено.")
                elif choice == '2':
                    for animal in animals:
                        print(animal.get_info())
                elif choice == '3':
                    name = input("Введите имя животного для обучения: ")
                    for animal in animals:
                        if animal.get_name() == name:
                            command = input("Введите команду для обучения: ")
                            animal.add_command(command)
                            print(f"Команда '{command}' добавлена для {animal.get_name()}.")
                            break
                    else:
                        print("Животное не найдено.")
                elif choice == '4':
                    name = input("Введите имя животного для показа команд: ")
                    for animal in animals:
                        if animal.get_name() == name:
                            print(f"Команды животного {animal.get_name()}: {animal.get_commands()}")
                            break
                    else:
                        print("Животное не найдено.")
                elif choice == '5':
                    print("Выход из программы.")
                    break
                else:
                    print("Неверный выбор. Попробуйте снова.")
    except Exception as e:
        print(e)

if __name__ == "__main__":
    menu()
