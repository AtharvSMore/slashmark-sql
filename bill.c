#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LENGTH 100  // Define a maximum length for strings

struct list {
    int id;
    char itemName[MAX_LENGTH];
    int price;
};

// Function to display the bill
void display(struct list *l, int size, char *cName, char *cAddress, float discount) {
    int total = 0;
    int i;
    
    printf("\n\n\n\n");
    printf("\t Atharv Store \n");
    printf("\t-------------- \n");
    printf("\n");
    printf("Name : %s \t Address : %s \n", cName, cAddress);
    printf("\n");

    for (i = 0; i < size; i++) {
        printf("Id : %d\t", l[i].id);
        printf("Name : %s\t", l[i].itemName);
        printf("Price : %d\n", l[i].price);
        printf("------------------------------------------------\n");
        total += l[i].price;
    }

    printf("\t\tTotal : %d\n", total);
    if (discount > 0) {
        printf("\t\tDiscount : %.2f%%\n", discount);
        printf("\t\tTotal after discount : %.2f\n", total * (1 - discount / 100));
    }
    printf("\n\n");
    printf("\t Thanks for visiting \n");
    printf("\n\n");
}

void inputItem(struct list *item, int id) {
    item->id = id;
    printf("Enter item name: ");
    while (getchar() != '\n');  // Clear the input buffer
    fgets(item->itemName, sizeof(item->itemName), stdin);
    item->itemName[strcspn(item->itemName, "\n")] = '\0';  // Remove the trailing newline character
    printf("Enter price: ");
    while (scanf("%d", &item->price) != 1 || item->price < 0) {
        printf("Invalid input. Please enter a non-negative number: ");
        while (getchar() != '\n');  // Clear the input buffer
    }
}

void modifyItem(struct list *l, int size) {
    int id;
    printf("Enter the item id to modify: ");
    while (scanf("%d", &id) != 1 || id <= 0 || id > size) {
        printf("Invalid input. Please enter a valid id: ");
        while (getchar() != '\n');  // Clear the input buffer
    }
    inputItem(&l[id - 1], id);
}

void searchItem(struct list *l, int size) {
    char searchName[MAX_LENGTH];
    int i;
    printf("Enter the item name to search: ");
    while (getchar() != '\n');  // Clear the input buffer
    fgets(searchName, sizeof(searchName), stdin);
    searchName[strcspn(searchName, "\n")] = '\0';  // Remove the trailing newline character

    for (i = 0; i < size; i++) {
        if (strcmp(l[i].itemName, searchName) == 0) {
            printf("Item found: Id: %d, Name: %s, Price: %d\n", l[i].id, l[i].itemName, l[i].price);
            return;
        }
    }
    printf("Item not found.\n");
}

int main() {
    char Name[MAX_LENGTH];
    char Address[MAX_LENGTH];
    int totalItems;
    struct list *l;
    int choice;
    int i;
    float discount = 0;

    printf("Hello.......\n");

    // Input name
    printf("Enter your name: ");
    fgets(Name, sizeof(Name), stdin);
    Name[strcspn(Name, "\n")] = '\0';  // Remove the trailing newline character

    // Input address
    printf("Enter your address: ");
    fgets(Address, sizeof(Address), stdin);
    Address[strcspn(Address, "\n")] = '\0';  // Remove the trailing newline character

    // Input total items
    printf("Enter total items: ");
    while (scanf("%d", &totalItems) != 1 || totalItems <= 0) {
        printf("Invalid input. Please enter a positive number: ");
        while (getchar() != '\n');  // Clear the input buffer
    }
    printf("\n");

    // Allocate memory for the items
    l = (struct list *)malloc(totalItems * sizeof(struct list));
    if (l == NULL) {
        printf("Memory allocation failed!\n");
        return 1;
    }

    // Insert items
    for (i = 0; i < totalItems; i++) {
        inputItem(&l[i], i + 1);
    }

    do {
        printf("\nMenu:\n");
        printf("1. Modify Item\n");
        printf("2. Search Item\n");
        printf("3. Apply Discount\n");
        printf("4. Display Bill\n");
        printf("5. Exit\n");
        printf("Enter your choice: ");
        while (scanf("%d", &choice) != 1) {
            printf("Invalid input. Please enter a number: ");
            while (getchar() != '\n');  // Clear the input buffer
        }

        switch (choice) {
            case 1:
                modifyItem(l, totalItems);
                break;
            case 2:
                searchItem(l, totalItems);
                break;
            case 3:
                printf("Enter discount percentage: ");
                while (scanf("%f", &discount) != 1 || discount < 0) {
                    printf("Invalid input. Please enter a non-negative number: ");
                    while (getchar() != '\n');  // Clear the input buffer
                }
                break;
            case 4:
                display(l, totalItems, Name, Address, discount);
                break;
            case 5:
                printf("Exiting...\n");
                break;
            default:
                printf("Invalid choice. Please try again.\n");
        }
    } while (choice != 5);

    // Free allocated memory
    free(l);

    return 0;
}

