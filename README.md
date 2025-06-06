1. What is PostgreSQL?

PostgreSQL একটি শক্তিশালী ওপেন সোর্স রিলেশনাল ডাটাবেস। এটি রিলেশনাল এসকিউএল এবং নন-রিলেশনাল JSON ডেটা এবং কোয়েরি ব্যবহারের অনুমতি দেয়।
 PostgreSQL এর পিছনে একটি শক্তিশালী সম্প্রদায় রয়েছে। PostgreSQL হল একটি অত্যন্ত নির্ভরযোগ্য ডাটাবেস ম্যানেজমেন্ট সিস্টেম যেখানে চমৎকার স্তরের সমর্থন, নিরাপত্তা এবং নির্ভুলতা রয়েছে।
 বেশ কিছু মোবাইল এবং ওয়েব অ্যাপ্লিকেশন তাদের ডিফল্ট ডাটাবেস হিসাবে PostgreSQL ব্যবহার করে।

2. What is the purpose of a database schema in PostgreSQL?

একটি PostgreSQL databese schema হলো ডেটাবেস বস্তুকে (যেমন - টেবিল, ভিউ, ফাংশন) সংগঠিত করার জন্য একটি লজিক্যাল কনটেইনার।
এটি ডেটাবেসটিকে আরও সহজে পরিচালনা করতে এবং ডেটাবেস অবজেক্টের মধ্যে সংঘর্ষ (conflict) এড়াতে সাহায্য করে। স্কিমা ব্যবহার করে,
একই ডেটাবেসে একাধিক ব্যবহারকারী ডেটাবেস অবজেক্ট তৈরি করতে পারে, কিন্তু তাদের মধ্যে কোনো দ্বন্দ্ব তৈরি হবে না।
এখানে স্কিমার কিছু মূল উদ্দেশ্য উল্লেখ করা হলো:
ডেটাবেস অবজেক্ট সংগঠিত করা, নামের সংঘর্ষ (conflict) এড়ানো, ব্যবহারকারীকে পৃথক করা, ডেটাবেসের রক্ষণাবেক্ষণ সহজ করা, পারফর্মেন্স বৃদ্ধি, ডেটার সামঞ্জস্য বজায় রাখা|

3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

Primary Key: হলো একটি টেবিলের এমন একটি কলাম (অথবা কলামের সমন্বয়) যা প্রতিটি রেকর্ডকে অনন্যভাবে চিহ্নিত করে। এটি NULL মান গ্রহণ করতে পারে না
 এবং প্রতিটি রেকর্ডের জন্য অবশ্যই ভিন্ন হতে হবে।
বৈশিষ্ট্য:
প্রতিটি রেকর্ডের জন্য প্রাইমারি কী অনন্য হতে হবে।
এটি কখনোই NULL হতে পারে না।
একটি টেবিলে শুধুমাত্র একটি প্রাইমারি কী থাকতে পারে।
Foreign Key: হলো একটি টেবিলের একটি কলাম (অথবা কলামের সমন্বয়) যা অন্য একটি টেবিলের প্রাইমারি কীর সাথে সম্পর্কিত।
 এটি টেবিলগুলোর মধ্যে সম্পর্ক স্থাপন করতে ব্যবহৃত হয় এবং এটি NULL মান গ্রহণ করতে পারে।
 
4. What is the difference between the VARCHAR and CHAR data types?
   
VARCHAR (Variable Length):VARCHAR ডাটা টাইপ একটি পরিবর্তনীয় দৈর্ঘ্যের স্ট্রিং স্টোর করে। উদাহরণস্বরূপ, VARCHAR(10) হলে,
এটি স্টোর করা স্ট্রিং এর প্রকৃত দৈর্ঘ্যের জন্য স্থান বরাদ্দ করবে, 10 অক্ষরের বেশি নয়।
CHAR:CHAR ডাটা টাইপ একটি নির্দিষ্ট দৈর্ঘ্যের স্ট্রিং স্টোর করে। উদাহরণস্বরূপ, CHAR(10) হলে, এটি সবসময় 10টি অক্ষরের জন্য স্থান বরাদ্দ করবে,
যদিও আপনি যদি কম সংখ্যক অক্ষর স্টোর করেন, তবে বাকী স্থানগুলি স্পেস (space) দিয়ে পূরণ করা হবে।
বৈশিষ্ট্য:
VARCHAR:
একটি পরিবর্তনীয় দৈর্ঘ্যের স্ট্রিং স্টোর করে।
স্টোরেজের জন্য স্ট্রিং এর প্রকৃত দৈর্ঘ্যের জন্য স্থান বরাদ্দ করে।
পারফর্মেন্সের ক্ষেত্রে কম ফাস্ট হতে পারে, কারণ স্ট্রিং এর দৈর্ঘ্যের উপর নির্ভর করে স্টোরেজ পরিবর্তন হতে পারে।
CHAR:
একটি নির্দিষ্ট দৈর্ঘ্যের স্ট্রিং স্টোর করে।
স্টোরেজের জন্য সবসময় নির্দিষ্ট স্থান বরাদ্দ করে।
কম স্ট্রিং স্টোর করার ক্ষেত্রে বাকী স্থান স্পেস দিয়ে পূরণ করে।
ব্যবহারের উদাহরণ:
VARCHAR:
যদি আপনি জানেন যে স্টোরেজ ডেটার আকার বিভিন্ন হতে পারে, যেমন - নাম, ঠিকানা, ইত্যাদি। 
CHAR:যদি আপনি জানেন যে স্টোরেজ ডেটার আকার সবসময় একই থাকবে, যেমন - আইডি কোড, স্ট্যাটাস কোড, ইত্যাদি। 

5. Explain the purpose of the WHERE clause in a SELECT statement.

SELECT statement-এ WHERE clause ব্যবহার করে ডেটা ফিল্টার করা হয়, মানে নির্দিষ্ট শর্ত পূরণ করে এমন শুধুমাত্র
সেই রো (row) গুলো নির্বাচন করা হয় যা ফলাফল (result) হিসেবে প্রদর্শিত হবে. এটি একটি ফিল্টার হিসেবে কাজ করে,
যা আপনাকে নির্দিষ্ট করে বলতে দেয় কোন রেকর্ডগুলো ফলাফলে অন্তর্ভুক্ত হবে. যদি WHERE clause না থাকে,
তাহলে SELECT statement টেবিল থেকে সব row কে ফেরত দেবে

