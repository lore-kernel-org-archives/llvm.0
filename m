Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BDF54907
	for <llvm@lists.linux.dev>; Wed, 26 Jun 2024 03:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719372195; cv=none; b=OAihFxdebkB85MGXyVl42VvWPos/+yWFKQEoIsaWld8IMs34eGl7Qj51740h5u5moEFiSKzgg8Cx73tyhniXROhZWua68TWa2Rgagog6r8SL1wOl7P2FN0GeB/dlPbD+mhdtV9CgswJFqaEbjEKIp1JVM/jpyJzs7R9d7CYgL3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719372195; c=relaxed/simple;
	bh=aWjn1rK90uH7zvPoIIMTcC/De3KqAp6uqTomLwmzbzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NDiuCBzOvn4Cws5JvtgFacQGM3orDKmMTCC1e+HRyUX87UeK0efDTkKXCZGMlYi1LZMP4ljO/pNl4aCMF7Hd15co9GH4CTofhdKUE6h9Ft8QGg3AH9OpXtHeQWyl/WI5AYwOIyUCQ86/B7ADZiPwcKmhriMnvnepqxvgno8VlwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSPvZkwP; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSPvZkwP"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dfab5f7e749so5602480276.0
        for <llvm@lists.linux.dev>; Tue, 25 Jun 2024 20:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719372193; x=1719976993; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iv3u99b064y1TsWE2viRxdT9uyZ/YeMIpIqbTIyfWg0=;
        b=KSPvZkwPwgbJZxUohxhxYCYSW4/r/GT85Oe4zg1qgFu46wYqCarYS8uxsglnZcZn05
         zLAJdWZ57oymz8h4R7UiONVcQw1q3PuuNK4/R3oHex6IyDYzs18MuL317La8FgImhhr4
         mr3mdljEWibXlIrb57GslWr0DRvzcVcbNDEtX1oFefGtoVLyk98zB4t/kG3Vbz4qKC55
         ZMn5iUnCV/61ijC2vcwvcoFt+aocHt93QIKFXfQ+vhr6H3htThVQ5kp8SYEsZCeRVEfJ
         6m+4fOlLgUw+AVnqf1YqIgbKNWaSJQsq48Nuw/V3i8UTxzrU/c+duAxjKb9KXboUvG3f
         wr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719372193; x=1719976993;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iv3u99b064y1TsWE2viRxdT9uyZ/YeMIpIqbTIyfWg0=;
        b=AVdeoetSa96XQS3RZ6ovIfhZAyZef6L1ovLXJvjEAAN9wdHlT2IfRgTx4z2TlR06Om
         IRXsWPFZt6LMrVxG+eRB6My6TrT2g5t68ViaC1OZTXG/MGWO6/CGiavmiHCciukSpZSz
         ksf/xn+1rpd3NEzXy41q+tWo9KHK7UD9WhxZZDP2r9CDefNAYbPBTitdzYSBriAYD4el
         LAQhXq7fcjClwnQZwCDkeA8/CKY5pAUD76rrzakQw3qOYCFXVJ406e4JLWkTMwKMuTuE
         7Zv7nKBjtHgslgsP+yumrvkkNUKoN4Dj7t3PMxDFNLzGmZ0Is76h2BLctzAXaJ/qoU2I
         OOFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgEIjos8nGZs+LHHlevncB83BTHYn2GtxCvdwG0RF3KFw3e3+IthFrhtiIbI+h0JmafpMjpAEJUmEbM8BlFNXh34kXDQ==
X-Gm-Message-State: AOJu0YyGCaaICSX8mDLbd5egRKYiGfD/ywU+lRfEYGXNXBYUjYM+BISu
	4bGoxkLegOHn6lgwQ5XqseGHhR073AfSiyW+gVrShfxfIkYJyCXK
X-Google-Smtp-Source: AGHT+IHb3wM9H5WMVTrsE2syyBb82TfzvE2pNvRpcgKYhK4WGjMD50iPrm/hNpnspsj/and9mebuWQ==
X-Received: by 2002:a5b:f90:0:b0:df7:7437:5801 with SMTP id 3f1490d57ef6-e0300ef0111mr9909472276.13.1719372192697;
        Tue, 25 Jun 2024 20:23:12 -0700 (PDT)
Received: from [127.0.1.1] (107-197-105-120.lightspeed.sntcca.sbcglobal.net. [107.197.105.120])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e02e62655b1sm4165494276.36.2024.06.25.20.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 20:23:12 -0700 (PDT)
From: Pei Li <peili.dev@gmail.com>
Date: Tue, 25 Jun 2024 20:23:10 -0700
Subject: [PATCH] kvm: Fix warning in__kvm_gpc_refresh
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-bug5-v1-1-e072ed5fce85@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJ2Je2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMyNT3aTSdFNd0xRjY6Mk01RTQzNDJaDSgqLUtMwKsDHRsbW1AFox/cJ
 WAAAA
To: David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>, 
 Sean Christopherson <seanjc@google.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org, 
 syzkaller-bugs@googlegroups.com, llvm@lists.linux.dev, 
 syzbot+fd555292a1da3180fc82@syzkaller.appspotmail.com, 
 Pei Li <peili.dev@gmail.com>
X-Mailer: b4 0.15-dev-13183
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719372190; l=2384;
 i=peili.dev@gmail.com; s=20240625; h=from:subject:message-id;
 bh=aWjn1rK90uH7zvPoIIMTcC/De3KqAp6uqTomLwmzbzw=;
 b=MhQKsSHjCelN+0W7sTUon0XvADfhupXmPz82SKJtr4qpcJEbC7Ig+R8b4TLKewDK8R6Hdy/qN
 zggzvVEplRSD2cYhuGn0i+u8jsC0aJEzwjSfa9ZDZGdUpktFKblDp8Y
X-Developer-Key: i=peili.dev@gmail.com; a=ed25519;
 pk=I6GWb2uGzELGH5iqJTSK9VwaErhEZ2z2abryRD6a+4Q=

Check for invalid hva address stored in data before calling
kvm_gpc_activate_hva() instead of only compare with 0.

Reported-by: syzbot+fd555292a1da3180fc82@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=fd555292a1da3180fc82
Tested-by: syzbot+fd555292a1da3180fc82@syzkaller.appspotmail.com
Signed-off-by: Pei Li <peili.dev@gmail.com>
---
Syzbot reports a warning message in __kvm_gpc_refresh(). This warning
requires at least one of gpa and uhva to be valid.
WARNING: CPU: 0 PID: 5090 at arch/x86/kvm/../../../virt/kvm/pfncache.c:259 __kvm_gpc_refresh+0xf17/0x1090 arch/x86/kvm/../../../virt/kvm/pfncache.c:259

We are calling it from kvm_gpc_activate_hva(). This function always calls
__kvm_gpc_activate() with INVALID_GPA. Thus, uhva must be valid to
disable this warning.

This patch checks for invalid hva address as well instead of only
comparing hva with 0 before calling kvm_gpc_activate_hva()

syzbot has tested the proposed patch and the reproducer did not trigger
any issue.

Tested on:

commit:         55027e68 Merge tag 'input-for-v6.10-rc5' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16ea803a980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e40800950091403a
dashboard link: https://syzkaller.appspot.com/bug?extid=fd555292a1da3180fc82
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16eeb53e980000

Note: testing is done by a robot and is best-effort only.
---
 arch/x86/kvm/xen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
index f65b35a05d91..de5f34492405 100644
--- a/arch/x86/kvm/xen.c
+++ b/arch/x86/kvm/xen.c
@@ -881,7 +881,7 @@ int kvm_xen_vcpu_set_attr(struct kvm_vcpu *vcpu, struct kvm_xen_vcpu_attr *data)
 			r = kvm_gpc_activate(&vcpu->arch.xen.vcpu_info_cache,
 					     data->u.gpa, sizeof(struct vcpu_info));
 		} else {
-			if (data->u.hva == 0) {
+			if (data->u.hva == 0 || kvm_is_error_hva(data->u.hva)) {
 				kvm_gpc_deactivate(&vcpu->arch.xen.vcpu_info_cache);
 				r = 0;
 				break;

---
base-commit: 2bfcfd584ff5ccc8bb7acde19b42570414bf880b
change-id: 20240625-bug5-5d332b5e5161

Best regards,
-- 
Pei Li <peili.dev@gmail.com>

