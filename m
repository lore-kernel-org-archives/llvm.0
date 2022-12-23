Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AC18F63
	for <llvm@lists.linux.dev>; Fri, 23 Dec 2022 14:52:11 +0000 (UTC)
Received: from localhost.localdomain (unknown [182.253.183.184])
	by gnuweeb.org (Postfix) with ESMTPSA id 248447E2AF;
	Fri, 23 Dec 2022 14:52:07 +0000 (UTC)
X-GW-Data: lPqxHiMPbJw1wb7CM9QUryAGzr0yq5atzVDdxTR0iA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
	s=default; t=1671807131;
	bh=oJEfdxT5/bQz94HuPnh6KWVv4Q97ynYQ98e0q4+hCvk=;
	h=From:To:Cc:Subject:Date:From;
	b=YygV2RW5JSy8TgXFKoGe+8Pt6f9MiEHg6IF2tCDLhe479MO+TbQsF1/9aX1wZ9o0O
	 nY7GFdrGJ/BaUVoVpHhlcUmp8RhOvMZkQ7FsQC6eHKvrVG5qSfB9n1BynklsdNosqr
	 DdQ4U+pNKyxtpOot4oyZJ1u6aOpCZ8o5w7oBRmE5HsaMkKFV8BjIeGoiwe7qiEcyr0
	 eRj97WcTkCp2t9XAceRnW2Edg3W/uPklIEruJuKhpZDi7DkQ8hNRvyCoRExyfNbrsZ
	 7Ui8LJlUu7GLArHNgXo7ZvWsBEkqqvrHZNKVi7P94mE5P/5RVQYygSBmMAjQnbCTXI
	 6MfQNp5Rz73bg==
From: Ammar Faizi <ammarfaizi2@gnuweeb.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	LLVM Mailing List <llvm@lists.linux.dev>
Subject: [PATCH v1] driver core: Silence 'unused-but-set variable' warning
Date: Fri, 23 Dec 2022 21:51:37 +0700
Message-Id: <20221223145137.3786601-1-ammar.faizi@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ammar Faizi <ammarfaizi2@gnuweeb.org>

Compiling with clang-16:

  drivers/base/module.c:36:6: error: variable 'no_warn' set but not \
  used [-Werror,-Wunused-but-set-variable]
          int no_warn;
              ^
  1 error generated.

A reason the @no_warn variable exists is:
sysfs_create_link() return value needs not be ignored to silence
another warning.

So don't remove @no_warn, but add a '(void)no_warn;'.

Cc: LLVM Mailing List <llvm@lists.linux.dev>
Signed-off-by: Ammar Faizi <ammarfaizi2@gnuweeb.org>
---
 drivers/base/module.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/base/module.c b/drivers/base/module.c
index 46ad4d636731..42f0b3b9e7f8 100644
--- a/drivers/base/module.c
+++ b/drivers/base/module.c
@@ -59,22 +59,23 @@ void module_add_driver(struct module *mod, struct device_driver *drv)
 		return;
 
 	/* Don't check return codes; these calls are idempotent */
 	no_warn = sysfs_create_link(&drv->p->kobj, &mk->kobj, "module");
 	driver_name = make_driver_name(drv);
 	if (driver_name) {
 		module_create_drivers_dir(mk);
 		no_warn = sysfs_create_link(mk->drivers_dir, &drv->p->kobj,
 					    driver_name);
 		kfree(driver_name);
 	}
+	(void)no_warn;
 }
 
 void module_remove_driver(struct device_driver *drv)
 {
 	struct module_kobject *mk = NULL;
 	char *driver_name;
 
 	if (!drv)
 		return;
 
 	sysfs_remove_link(&drv->p->kobj, "module");

base-commit: 8395ae05cb5a2e31d36106e8c85efa11cda849be
-- 
Ammar Faizi

