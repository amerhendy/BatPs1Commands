# **🛠️ مجموعة سكريبتات وأدوات الأتمتة (Automation & Utility Scripts)**

مجموعة شاملة وأدوات أتمتة متطورة مكتوبة بلغات مختلفة (**Batch**, **PowerShell**, **Python**, **Bash**) لتدفقات العمل المختلفة مثل النسخ الاحتياطي، إدارة Docker، مزامنة قواعد البيانات، وأدوات المطورين.

# **📂 محتويات المستودع (Repository Index)**

| المجلد (Folder) | نوع السكريبتات | الوصف الوظيفي | التفاصيل |
| ----: | ----: | ----: | ----: |
| 📁 **`7-Zip_Automation_System`** | `Batch (.bat)` | أتمتة عمليات النسخ الاحتياطي وضغط المشاريع باستخدام 7-Zip | عرض README |
| 📁 **`Bundle_Backend_Script`** | `PowerShell (.ps1)` | سكريبت تجميع وتجهيز مشاريع الباك إند (Backend Bundling) | عرض README |
| 📁 **`Docker_backup_restore`** | `Batch (.bat)` | أدوات أتمتة عمليات النسخ الاحتياطي والاستعادة والمزامنة لبيئات Docker | عرض README |
| 📁 **`Docker_postgresql_backup_restore`** | `Shell (.sh)` | سكريبتات الشيل لأخذ نسخ احتياطية واستعادة قواعد بيانات PostgreSQL داخل حاويات Docker | عرض README |
| 📁 **`docker_usb_import_home`** | `PowerShell (.ps1)` | أتمتة استيراد بيئات ومسارات Docker من وحدات التخزين الخارجية (USB) | عرض README |
| 📁 **`Git_DB_Hybrid_Sync_System`** | `Batch (.bat)` | أتمتة إعداد بيئة العمل ومزامنة كود Git مع قواعد البيانات عند بداية ونهاية اليوم | عرض README |
| 📁 **`PostgreSQL_Upsert_Converter`** | `Python (.py)` | أداة بايثون لتحويل ومعالجة استعلامات وإدخالات PostgreSQL إلى صيغة (Upsert) | عرض README |
| 📁 **`Project_Tree_Structure`** | `PowerShell (.ps1)` | سكريبت لتوليد وعرض الهيكل الشجري للمشاريع المبرمجة بسهولة | عرض README |
| 📁 **`usbgitrepo`** | `PowerShell (.ps1)` | Amer Sync هو نظام مكتبي متطور مصمم خصيصاً للمبرمجين والمطورين (خاصة عشاق Laravel) لإدارة وتزامن المشاريع بين جهاز العمل والفلاشة (USB) بضغطة زر واحدة، باستخدام قوة محرك Git. | عرض README |

# **🚀 المتطلبات التشغيلية (Prerequisites)**

حسب السكريبت الذي ترغب في استخدامه، تأكد من توفر البيئة المناسبة:

* **Windows Command Prompt (`.bat`):** لتشغيل سكريبتات الدفعة على نظام ويندوز.  
* **PowerShell (`.ps1`):** يلزم صلاحية التشغيل على النظام (Execution Policy):Set-ExecutionPolicy \-ExecutionPolicy RemoteSigned \-Scope CurrentUser  
* **Python 3.x (`.py`):** لتشغيل أدوات المعالجة مثل محول PostgreSQL.  
* **Bash / Linux Shell (`.sh`):** مخصص لبيئات Linux/WSL أو حاويات Docker.  
* **Docker & 7-Zip:** بعض السكريبتات تتطلب وجود برنامج 7-Zip أو بيئة Docker مثبتة ومضافة لمتغيرات النظام (PATH).

# **💻 طريقة الاستخدام (Quick Start)**

1. قم باستنساخ المستودع (Clone):git clone https://github.com/amerhendy/BatPs1Commands.git  
2. انتقل إلى المجلد المطلوب:cd Folder\_Name  
3. اطلع على ملف `README.md` الفرعي داخل المجلد لمعرفة تفاصيل المعاملات والتعليمات الخاصة بالسكريبت.

# **📝 ملاحظات (Notes)**

* يُوصى دائمًا بمراجعة قيم المتغيرات ومسارات الملفات داخل السكريبتات لتناسب بيئة العمل الخاصة بك قبل التشغيل.  
* الترخيص مفتوح للمساهمة والتطوير.

