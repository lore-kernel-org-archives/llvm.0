Received: from dggsgout11.his.huawei.com (unknown [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8E3627
	for <llvm@lists.linux.dev>; Fri, 16 Jun 2023 01:26:19 +0000 (UTC)
Received: from mail02.huawei.com (unknown [172.30.67.153])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Qj1hQ6Rbmz4f3kKy
	for <llvm@lists.linux.dev>; Fri, 16 Jun 2023 09:26:14 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
	by APP4 (Coremail) with SMTP id gCh0CgAHvbA0uotkbPc3Lw--.48109S4;
	Fri, 16 Jun 2023 09:26:14 +0800 (CST)
From: Yu Kuai <yukuai1@huaweicloud.com>
To: song@kernel.org,
	axboe@kernel.dk,
	nathan@kernel.org,
	ndesaulniers@google.com,
	yukuai3@huawei.com
Cc: linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	yukuai1@huaweicloud.com,
	yi.zhang@huawei.com,
	yangerkun@huawei.com
Subject: [PATCH] md/raid1-10: fix casting from randomized structure in raid1_submit_write()
Date: Fri, 16 Jun 2023 09:21:36 +0800
Message-Id: <20230616012136.3047071-1-yukuai1@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgAHvbA0uotkbPc3Lw--.48109S4
X-Coremail-Antispam: 1UD129KBjvJXoW7trWxWrWkWr1Dury3XryrWFg_yoW8JFWkpa
	yj9ay5W3yUGrWUu3WDGFW8ua15Ka1qg3ya9a95Cw4aqa4YqFWDXa18t3yUJrn5AF1Fkry3
	ZFyUKw4Fkw1UtFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvY14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v2
	6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0J
	UdHUDUUUUU=
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected

From: Yu Kuai <yukuai3@huawei.com>

Following build error triggered while build with clang version 17.0.0
with W=1(this can't be reporduced with gcc 13.1.0):

drivers/md/raid1-10.c:117:25: error: casting from randomized structure
pointer type 'struct block_device *' to 'struct md_rdev *'
     117 |         struct md_rdev *rdev = (struct md_rdev *)bio->bi_bdev;
         |                                ^

Fix this by casting 'bio->bi_bdev' to 'void *', as it used to be.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202306142042.fmjfmTF8-lkp@intel.com/
Fixes: 8295efbe68c0 ("md/raid1-10: factor out a helper to submit normal write")
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/md/raid1-10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/raid1-10.c b/drivers/md/raid1-10.c
index 169ebe296f2d..3f22edec70e7 100644
--- a/drivers/md/raid1-10.c
+++ b/drivers/md/raid1-10.c
@@ -116,7 +116,7 @@ static void md_bio_reset_resync_pages(struct bio *bio, struct resync_pages *rp,
 
 static inline void raid1_submit_write(struct bio *bio)
 {
-	struct md_rdev *rdev = (struct md_rdev *)bio->bi_bdev;
+	struct md_rdev *rdev = (void *)bio->bi_bdev;
 
 	bio->bi_next = NULL;
 	bio_set_dev(bio, rdev->bdev);
-- 
2.39.2

