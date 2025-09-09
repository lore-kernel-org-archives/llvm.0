Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1471F3D58;
	Tue,  9 Sep 2025 21:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757454826; cv=none; b=ABl979wxpqg7PcBz0BI5OO/fMwyVYK71AXrU1GvH0923upXJobmiQC6XJKkChfEcLuwrpjEjTsMgCs4E4ELcDVwGX6YOMYwm0OfYP2Tc8TuQfdKH0UlQ/Qmv4/WElS6msDHaW3NVnZfvvq1Esbed64KluiVFPZkVByJBS3Njozg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757454826; c=relaxed/simple;
	bh=JfV3jcyCfrGLgp5szqgkAln9z/dw+6m7BtuEawilnqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fuSQS/9KlmGDpPTsH3vsUdIY8cVfaOGiCiINxSlJ330yCobsujUlAp/wbQvyJMm8l3YVXk6grFCyjXutceroCHuZfrvBZvJMBeMUTBK0gllS2bkaiiP+hs+HUI2+Ymg8PWomNEOMRt1NUsgzMftI1r1OZxSq+n39NdJH5jYpKbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mv6x6JCp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mv6x6JCp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15B26C4CEF4;
	Tue,  9 Sep 2025 21:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757454826;
	bh=JfV3jcyCfrGLgp5szqgkAln9z/dw+6m7BtuEawilnqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mv6x6JCpz23oxi9dzTkHo/LiLRkEXdfSXyCBeEVTlBlazUDZwgM/Dvxmvsf6sc5AO
	 upfsNnLmmG7ErBLIoKhZKe+qu9Ksgug6FvY616Ayk0ku4WEdMrexobSTvLyacfD13b
	 URNOobeTSKu5NpSfceOTo6mqa2xv140chCL2UvkhVxHE/Z1RyF+DU1GKO0py9JWpdY
	 cGYPhC4H60VlTsMDKd0RJezh4+pY1+CiAmm5KesVuzeQlJ/nWINFow3mOFTFMVGiN6
	 Y+WQ7j+7FpxvB/fnvHMRWotC5O+BWOo0RQpCQSLsXw56y1nHwiM1y9Btaa/LnzK5cK
	 I3JxTJS4RHHUg==
Date: Tue, 9 Sep 2025 14:53:42 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [jirislaby:devel 28/53] drivers/tty/vt/keyboard.c:1789:7: error:
 cannot jump from this asm goto statement to one of its possible targets
Message-ID: <20250909215342.GA2456480@ax162>
References: <202509091702.Oc7eCRDw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202509091702.Oc7eCRDw-lkp@intel.com>

On Tue, Sep 09, 2025 at 05:10:36PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
> head:   71311086e214f78774f7c36ef14866b211ea94df
> commit: 215a9ed05f527245cba11f20f81cf39637088b78 [28/53] vt/keyboard: use __free()
> config: arm64-randconfig-001-20250909 (https://download.01.org/0day-ci/archive/20250909/202509091702.Oc7eCRDw-lkp@intel.com/config)
> compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509091702.Oc7eCRDw-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509091702.Oc7eCRDw-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/tty/vt/keyboard.c:1789:7: error: cannot jump from this asm goto statement to one of its possible targets
>                    if (get_user(ct, &a->kb_cnt))
>                        ^
>    arch/arm64/include/asm/uaccess.h:272:18: note: expanded from macro 'get_user'
>    #define get_user        __get_user
>                            ^
>    arch/arm64/include/asm/uaccess.h:268:2: note: expanded from macro '__get_user'
>            __get_user_error((x), (ptr), __gu_err);                         \
>            ^
>    arch/arm64/include/asm/uaccess.h:258:3: note: expanded from macro '__get_user_error'
>                    __raw_get_user((x), __p, __gu_failed);                  \
>                    ^
>    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>    arch/arm64/include/asm/uaccess.h:211:3: note: expanded from macro '__raw_get_mem'
>                    __get_mem_asm(ldr "b", "%w", __gu_val, (ptr), label, type);     \
>                    ^
>    arch/arm64/include/asm/uaccess.h:189:2: note: expanded from macro '__get_mem_asm'
>            asm_goto_output(                                                \
>            ^
>    include/linux/compiler_types.h:488:31: note: expanded from macro 'asm_goto_output'
>    #define asm_goto_output(x...) asm volatile goto(x)
>                                  ^
>    drivers/tty/vt/keyboard.c:1736:7: note: possible target of asm goto statement
>                    if (put_user(asize, &a->kb_cnt))
>                        ^
>    arch/arm64/include/asm/uaccess.h:369:18: note: expanded from macro 'put_user'
>    #define put_user        __put_user
>                            ^
>    arch/arm64/include/asm/uaccess.h:365:2: note: expanded from macro '__put_user'
>            __put_user_error((x), (ptr), __pu_err);                         \
>            ^
>    arch/arm64/include/asm/uaccess.h:355:3: note: expanded from macro '__put_user_error'
>                    __raw_put_user((x), __p, __pu_failed);                  \
>                    ^
>    arch/arm64/include/asm/uaccess.h:342:2: note: expanded from macro '__raw_put_user'
>            __rpu_failed:                                                   \
>            ^
>    drivers/tty/vt/keyboard.c:1784:23: note: jump exits scope of variable with __attribute__((cleanup))
>                    void __free(kfree) *buf = NULL;
>                                        ^
>    drivers/tty/vt/keyboard.c:1722:23: note: jump bypasses initialization of variable with __attribute__((cleanup))
>                    void __free(kfree) *buf = kmalloc_array(MAX_DIACR, sizeof(struct kbdiacruc),
>                                        ^

Unfortunately, this is an instance of
https://github.com/ClangBuiltLinux/linux/issues/1886#issuecomment-1645979992,
which was fixed in clang-17. This could be worked around by separating
each case statement into its own function to hide from the scope checker
but I am not sure how palpable that is...

Cheers,
Nathan

diff --git a/drivers/tty/vt/keyboard.c b/drivers/tty/vt/keyboard.c
index 5c495753c883..1887bf34aa73 100644
--- a/drivers/tty/vt/keyboard.c
+++ b/drivers/tty/vt/keyboard.c
@@ -1649,134 +1649,143 @@ int __init kbd_init(void)
 
 /* Ioctl support code */
 
-/**
- *	vt_do_diacrit		-	diacritical table updates
- *	@cmd: ioctl request
- *	@udp: pointer to user data for ioctl
- *	@perm: permissions check computed by caller
- *
- *	Update the diacritical tables atomically and safely. Lock them
- *	against simultaneous keypresses
- */
-int vt_do_diacrit(unsigned int cmd, void __user *udp, int perm)
+static int vt_do_kdgkbdiacr(void __user *udp)
 {
-	int asize;
-
-	switch (cmd) {
-	case KDGKBDIACR:
-	{
-		struct kbdiacrs __user *a = udp;
-		int i;
+	struct kbdiacrs __user *a = udp;
+	int i, asize;
 
-		struct kbdiacr __free(kfree) *dia = kmalloc_array(MAX_DIACR, sizeof(struct kbdiacr),
-								  GFP_KERNEL);
-		if (!dia)
-			return -ENOMEM;
+	struct kbdiacr __free(kfree) *dia = kmalloc_array(MAX_DIACR, sizeof(struct kbdiacr),
+							  GFP_KERNEL);
+	if (!dia)
+		return -ENOMEM;
 
-		/* Lock the diacriticals table, make a copy and then
-		   copy it after we unlock */
-		scoped_guard(spinlock_irqsave, &kbd_event_lock) {
-			asize = accent_table_size;
-			for (i = 0; i < asize; i++) {
-				dia[i].diacr = conv_uni_to_8bit(accent_table[i].diacr);
-				dia[i].base = conv_uni_to_8bit(accent_table[i].base);
-				dia[i].result = conv_uni_to_8bit(accent_table[i].result);
-			}
+	/* Lock the diacriticals table, make a copy and then
+	   copy it after we unlock */
+	scoped_guard(spinlock_irqsave, &kbd_event_lock) {
+		asize = accent_table_size;
+		for (i = 0; i < asize; i++) {
+			dia[i].diacr = conv_uni_to_8bit(accent_table[i].diacr);
+			dia[i].base = conv_uni_to_8bit(accent_table[i].base);
+			dia[i].result = conv_uni_to_8bit(accent_table[i].result);
 		}
-
-		if (put_user(asize, &a->kb_cnt))
-			return -EFAULT;
-		if (copy_to_user(a->kbdiacr, dia, asize * sizeof(struct kbdiacr)))
-			return -EFAULT;
-		return 0;
 	}
-	case KDGKBDIACRUC:
-	{
-		struct kbdiacrsuc __user *a = udp;
 
-		void __free(kfree) *buf = kmalloc_array(MAX_DIACR, sizeof(struct kbdiacruc),
-							GFP_KERNEL);
-		if (buf == NULL)
-			return -ENOMEM;
+	if (put_user(asize, &a->kb_cnt))
+		return -EFAULT;
+	if (copy_to_user(a->kbdiacr, dia, asize * sizeof(struct kbdiacr)))
+		return -EFAULT;
+	return 0;
+}
 
-		/* Lock the diacriticals table, make a copy and then
-		   copy it after we unlock */
-		scoped_guard(spinlock_irqsave, &kbd_event_lock) {
-			asize = accent_table_size;
-			memcpy(buf, accent_table, asize * sizeof(struct kbdiacruc));
-		}
+static int vt_do_kdgkbdiacruc(void __user *udp)
+{
+	struct kbdiacrsuc __user *a = udp;
+	int asize;
 
-		if (put_user(asize, &a->kb_cnt))
-			return -EFAULT;
-		if (copy_to_user(a->kbdiacruc, buf, asize * sizeof(struct kbdiacruc)))
-			return -EFAULT;
+	void __free(kfree) *buf = kmalloc_array(MAX_DIACR, sizeof(struct kbdiacruc),
+						GFP_KERNEL);
+	if (buf == NULL)
+		return -ENOMEM;
 
-		return 0;
+	/* Lock the diacriticals table, make a copy and then
+	   copy it after we unlock */
+	scoped_guard(spinlock_irqsave, &kbd_event_lock) {
+		asize = accent_table_size;
+		memcpy(buf, accent_table, asize * sizeof(struct kbdiacruc));
 	}
 
-	case KDSKBDIACR:
-	{
-		struct kbdiacrs __user *a = udp;
-		struct kbdiacr __free(kfree) *dia = NULL;
-		unsigned int ct;
-		int i;
+	if (put_user(asize, &a->kb_cnt))
+		return -EFAULT;
+	if (copy_to_user(a->kbdiacruc, buf, asize * sizeof(struct kbdiacruc)))
+		return -EFAULT;
 
-		if (!perm)
-			return -EPERM;
-		if (get_user(ct, &a->kb_cnt))
-			return -EFAULT;
-		if (ct >= MAX_DIACR)
-			return -EINVAL;
+	return 0;
+}
 
-		if (ct) {
-			dia = memdup_array_user(a->kbdiacr,
-						ct, sizeof(struct kbdiacr));
-			if (IS_ERR(dia))
-				return PTR_ERR(dia);
-		}
+static int vt_do_kdskbdiacr(void __user *udp, int perm)
+{
+	struct kbdiacrs __user *a = udp;
+	struct kbdiacr __free(kfree) *dia = NULL;
+	unsigned int ct;
+	int i;
 
-		guard(spinlock_irqsave)(&kbd_event_lock);
-		accent_table_size = ct;
-		for (i = 0; i < ct; i++) {
-			accent_table[i].diacr =
-					conv_8bit_to_uni(dia[i].diacr);
-			accent_table[i].base =
-					conv_8bit_to_uni(dia[i].base);
-			accent_table[i].result =
-					conv_8bit_to_uni(dia[i].result);
-		}
+	if (!perm)
+		return -EPERM;
+	if (get_user(ct, &a->kb_cnt))
+		return -EFAULT;
+	if (ct >= MAX_DIACR)
+		return -EINVAL;
 
-		return 0;
+	if (ct) {
+		dia = memdup_array_user(a->kbdiacr,
+					ct, sizeof(struct kbdiacr));
+		if (IS_ERR(dia))
+			return PTR_ERR(dia);
 	}
 
-	case KDSKBDIACRUC:
-	{
-		struct kbdiacrsuc __user *a = udp;
-		unsigned int ct;
-		void __free(kfree) *buf = NULL;
+	guard(spinlock_irqsave)(&kbd_event_lock);
+	accent_table_size = ct;
+	for (i = 0; i < ct; i++) {
+		accent_table[i].diacr =
+				conv_8bit_to_uni(dia[i].diacr);
+		accent_table[i].base =
+				conv_8bit_to_uni(dia[i].base);
+		accent_table[i].result =
+				conv_8bit_to_uni(dia[i].result);
+	}
 
-		if (!perm)
-			return -EPERM;
+	return 0;
+}
 
-		if (get_user(ct, &a->kb_cnt))
-			return -EFAULT;
+static int vt_do_kdskbdiacruc(void __user *udp, int perm)
+{
+	struct kbdiacrsuc __user *a = udp;
+	unsigned int ct;
+	void __free(kfree) *buf = NULL;
 
-		if (ct >= MAX_DIACR)
-			return -EINVAL;
+	if (!perm)
+		return -EPERM;
 
-		if (ct) {
-			buf = memdup_array_user(a->kbdiacruc,
-						ct, sizeof(struct kbdiacruc));
-			if (IS_ERR(buf))
-				return PTR_ERR(buf);
-		}
-		guard(spinlock_irqsave)(&kbd_event_lock);
-		if (ct)
-			memcpy(accent_table, buf,
-					ct * sizeof(struct kbdiacruc));
-		accent_table_size = ct;
-		return 0;
+	if (get_user(ct, &a->kb_cnt))
+		return -EFAULT;
+
+	if (ct >= MAX_DIACR)
+		return -EINVAL;
+
+	if (ct) {
+		buf = memdup_array_user(a->kbdiacruc,
+					ct, sizeof(struct kbdiacruc));
+		if (IS_ERR(buf))
+			return PTR_ERR(buf);
 	}
+	guard(spinlock_irqsave)(&kbd_event_lock);
+	if (ct)
+		memcpy(accent_table, buf,
+				ct * sizeof(struct kbdiacruc));
+	accent_table_size = ct;
+	return 0;
+}
+
+/**
+ *	vt_do_diacrit		-	diacritical table updates
+ *	@cmd: ioctl request
+ *	@udp: pointer to user data for ioctl
+ *	@perm: permissions check computed by caller
+ *
+ *	Update the diacritical tables atomically and safely. Lock them
+ *	against simultaneous keypresses
+ */
+int vt_do_diacrit(unsigned int cmd, void __user *udp, int perm)
+{
+	switch (cmd) {
+	case KDGKBDIACR:
+		return vt_do_kdgkbdiacr(udp);
+	case KDGKBDIACRUC:
+		return vt_do_kdgkbdiacruc(udp);
+	case KDSKBDIACR:
+		return vt_do_kdskbdiacr(udp, perm);
+	case KDSKBDIACRUC:
+		return vt_do_kdskbdiacruc(udp, perm);
 	}
 	return 0;
 }
