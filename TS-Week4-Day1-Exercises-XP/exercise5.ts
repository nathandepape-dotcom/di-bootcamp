// 🌟 Exercise 5 : Extending Interfaces with Optional and Readonly Properties
// 1. Create an interface User with: id (readonly), name, and email.
// 2. Extend it into an interface PremiumUser with an optional property membershipLevel.
// 3. Create a function printUserDetails that accepts a PremiumUser and logs its details.

interface User {
    readonly id: number;
    name: string;
    email: string;
}

// PremiumUser has everything from User + an optional property (?)
interface PremiumUser extends User {
    membershipLevel?: string;
}

function printUserDetails(user: PremiumUser): void {
    console.log(`ID: ${user.id}`);
    console.log(`Name: ${user.name}`);
    console.log(`Email: ${user.email}`);
    console.log(`Membership: ${user.membershipLevel ?? "none"}`);
}

const premiumUser: PremiumUser = {
    id: 1,
    name: "Nathan",
    email: "nathan@example.com",
    membershipLevel: "Gold",
};

const basicUser: PremiumUser = { id: 2, name: "Dana", email: "dana@example.com" };

printUserDetails(premiumUser);
printUserDetails(basicUser);
