# 初階後端工程師技術測試

## 技術要求

- .NET Core 8 (LTS) Web API（不可使用 .NET 9）
- SQL Server：資料庫 `Myoffice_ACPD`
- 不限制 Entity Framework Core 或任何 ORM
- Visual Studio 2022（需能執行 Swagger）
- Git & GitHub

參考資料：`TSQLScript` 目錄內的範例檔案

---

## 考試時限
- 請在收到考題後的 2 小時內完成並提交
- 時間從收到考題通知開始計算
- 若有特殊情況無法於時限內完成，請主動來信說明原因

---

## 專案要求

### Web API
- 實作完整 CRUD 功能，連線至 SQL Server
- Swagger 需包含測試資料並可正常呼叫
- 按 F5 即可啟動並顯示 Swagger 介面

**1. 正確使用 HTTP Method**
- `GET`：查詢資料（不可使用 GET 進行資料異動）
- `POST`：新增資料
- `PUT / PATCH`：更新資料
- `DELETE`：刪除資料

**2. 資源導向 URL 設計**
- URL 必須為資源導向（Resource-based）
- 不可出現 `/GetData`、`/DeleteData` 這類動作型命名

```
GET    /api/myofficeacpd          # 查詢所有資料
GET    /api/myofficeacpd/{id}     # 查詢單筆資料
POST   /api/myofficeacpd          # 新增資料
PUT    /api/myofficeacpd/{id}     # 更新資料
DELETE /api/myofficeacpd/{id}     # 刪除資料
```

**3. 必須回傳正確的 HTTP Status Code**
- `200 OK`：請求成功
- `201 Created`：資源成功建立
- `204 No Content`：請求成功但無回傳內容（通常用於 DELETE）
- `400 Bad Request`：請求參數有誤
- `404 Not Found`：資源不存在
- `500 Internal Server Error`：伺服器內部錯誤

**4. Swagger 測試**
- Swagger 必須可正常測試所有 RESTful Endpoint
- 每個 API 附有測試用 JSON 資料
- 可直接在 Swagger UI 進行完整的 CRUD 操作測試

### SQL Server
- 建立資料庫 `Myoffice_ACPD`（參考 `TSQLScript` 內的資料表結構）
- 產出資料庫備份檔 `.bak`
- 所有 `.sql` 腳本與 `.bak` 檔案推送至 GitHub，備份檔須可正常還原並包含完整測試資料。

### Git 版本管理
- Repository 命名：`YourName_BackendTest`
- `main` 分支：存放 SQL 腳本與 `.bak` 檔案
- `feature/crud-api` 分支：開發 Web API
- 發起 Pull Request，說明修改內容

---

## 繳交清單

- [ ] GitHub Repository（包含 `main` 和 `feature/crud-api` 分支）
- [ ] Swagger 可正常執行 CRUD
- [ ] SQL 腳本與 `.bak` 檔案
- [ ] 至少一次有意義的 Commit 與 PR 說明
- [ ] 提供 GitHub Repository URL