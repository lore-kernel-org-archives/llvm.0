Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE19D19885F
	for <llvm@lists.linux.dev>; Thu, 27 Jun 2024 15:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719500642; cv=none; b=CJNqlWBLyTZrVvyjbx4KjSY9gxGFSdN2FSZa5CB1hXc2Vfn+izyFfirKHBv7tVEd5hWFhptlTbTu/OHZh2EDLsqC6pUE705hJDdshqB3irjaWa8ROn5gHiNSUbq4mqNPtzm2PTZ2C8jfkb06XBY+ArZGEuu+CElndDQApsSmGTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719500642; c=relaxed/simple;
	bh=l73llJCUIKUxRecupdaIxSy64eMLHxkbYexteymENJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=t8KwU/hoBvS7HfSlq2FGsVFqzv99FM+8bZKUSIpzp9yrLq3RpiWJG2R5jIEwnl0GSFuUxIan3+kBue5DMkKntlmU9fm2j+Nq87Jq4H17ueTYNZz4uwd11NUDXCebXdmxqFJBk2KpUifGR/+cupvg6X3FRHPP8xKmisHXIbvkErs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DB0Yn3R8; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DB0Yn3R8"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-64789495923so29289207b3.0
        for <llvm@lists.linux.dev>; Thu, 27 Jun 2024 08:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719500640; x=1720105440; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8RPqAWJX29gQXV8+Zzq9GyOhgk6BXLzXmKNl8pcyJtY=;
        b=DB0Yn3R8Q0p3KJQlFY+WP9qGUUXo+Q6NCumGq+oIEHQpu1ODnExtNX7Z9MnIAD+6j0
         ScxnGQ7w2ygmGal0NFwhU0jeJkPXga2fNp/7RWcH0JgsUwrM+x+YMCEm5GbRw7nS4cVq
         AQXBLkLDr3ysifGv0g5GQijwkiSOewRsGBL+VzyBPDA/wBiL5OAWhYcn/M4nWqgyuEAR
         g/KI/kkalvuz1y3VIF5GYK7fv8TXkYsDC+7d19mgcCx40W3zCD/A5SDr/Yn5wVTHRane
         hsqyU1Szkw9JpinG/SKlj8pfs5f5c1vPgjH0E3w0ziw+n0haAUC3gBSw3fYyoqw44uAZ
         QQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500640; x=1720105440;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8RPqAWJX29gQXV8+Zzq9GyOhgk6BXLzXmKNl8pcyJtY=;
        b=smXYh1ZiwfcEeSv+0MBHRS2XQTCZ7D4y2tTqun+wxdYF9+M8iIKiGPBTgakr3aNpOL
         LCoMFbjJLFG+iTNxwwH9nPQ0MbZUBsuglmt3KPbRUyMqua5K8KOkN8c0igTiRHWPGfyu
         1GF3C+D2s3GhN885pjgHqcBj5xVhaUTyaiTjoVxZ4N7mfZq5xzlGeQ5VaGJT1mrQhFSZ
         HbzJIZlPNpY/ksxPXVC51JGJ4i4ekerDc8XNSxLUCyfWz5khO259/TMqEziX2acabkVC
         r22U2F48h7rZnD6MHQrdFmuUBUa7tfdWjnKxGV+XNwD9ydacggr+4kF/8ouyXAjPM8Zj
         c5Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUJAc+w+2NhJ+lrV1ABl6VwDiouleZcmhyzw+xOaoLmRvZXCM47hDcb+dO9mj+s71ES1fewCWs9L8P7zLr4G8urOEueNg==
X-Gm-Message-State: AOJu0YzG1Er/5Bl6OWNhjpZGFtLYNAO20aJ/3JbJnEdtd1DyhW6Oiv2g
	S0e4/mU0OY257pHAyidZWHqZqfY+fkDXAp70ycOdn15n3VR8qvoE
X-Google-Smtp-Source: AGHT+IHKPiZpyKzGZOIL3xcH+XD1DwotbRWUXOrtZQP4/3YIqhVff++wSdOu73KnfBIM4SnpEwRkxw==
X-Received: by 2002:a05:690c:6c0d:b0:618:ce10:2fcd with SMTP id 00721157ae682-643aa5a426dmr160071517b3.26.1719500639499;
        Thu, 27 Jun 2024 08:03:59 -0700 (PDT)
Received: from [127.0.1.1] (107-197-105-120.lightspeed.sntcca.sbcglobal.net. [107.197.105.120])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6497a755ad2sm2770537b3.76.2024.06.27.08.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:03:59 -0700 (PDT)
From: Pei Li <peili.dev@gmail.com>
Date: Thu, 27 Jun 2024 08:03:56 -0700
Subject: [PATCH v2] kvm: Fix warning in__kvm_gpc_refresh
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-bug5-v2-1-2c63f7ee6739@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFt/fWYC/13MywrCMBCF4VcpszaSTJ0qrnwP6aJNpumAvZBoU
 Ere3dily/9w+DaIHIQjXKsNAieJsswl8FCBHbvZsxJXGlDjSTdIqn95UuTqGntiMo2Bcl0DD/L
 emXtbepT4XMJnV5P5rX9AMsoo1mdkR4PlC9381MnjaJcJ2pzzF1jDf06YAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719500637; l=3041;
 i=peili.dev@gmail.com; s=20240625; h=from:subject:message-id;
 bh=l73llJCUIKUxRecupdaIxSy64eMLHxkbYexteymENJA=;
 b=Q6AcEfxFpP9UNEK+Is8AMNrTHFxa+L3BtOlJnguHVBEfUlnNBuNoRPOKwzHwnZlGMGU8jDnuP
 O7DDJoKQC6WBBXgb7f9M59UF437eNqYW1ygW3LzJjccTFadkoS8MP6h
X-Developer-Key: i=peili.dev@gmail.com; a=ed25519;
 pk=I6GWb2uGzELGH5iqJTSK9VwaErhEZ2z2abryRD6a+4Q=

Check for invalid hva address stored in data and return -EINVAL before
calling into __kvm_gpc_activate().

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

This patch checks for invalid hva address and return -EINVAL before
calling __kvm_gpc_activate().

syzbot has tested the proposed patch and the reproducer did not trigger
any issue.

Tested on:

commit:         afcd4813 Merge tag 'mm-hotfixes-stable-2024-06-26-17-2..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1427e301980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e40800950091403a
dashboard link: https://syzkaller.appspot.com/bug?extid=fd555292a1da3180fc82
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13838f3e980000

Note: testing is done by a robot and is best-effort only.
---
Changes in v2:
- Adapted Sean's suggestion to check for valid address before calling
  into __kvm_gpc_activate().
- Link to v1: https://lore.kernel.org/r/20240625-bug5-v1-1-e072ed5fce85@gmail.com
---
 arch/x86/kvm/xen.c  | 2 +-
 virt/kvm/pfncache.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
index f65b35a05d91..67bb4e89c399 100644
--- a/arch/x86/kvm/xen.c
+++ b/arch/x86/kvm/xen.c
@@ -741,7 +741,7 @@ int kvm_xen_hvm_set_attr(struct kvm *kvm, struct kvm_xen_hvm_attr *data)
 		} else {
 			void __user * hva = u64_to_user_ptr(data->u.shared_info.hva);
 
-			if (!PAGE_ALIGNED(hva) || !access_ok(hva, PAGE_SIZE)) {
+			if (!PAGE_ALIGNED(hva)) {
 				r = -EINVAL;
 			} else if (!hva) {
 				kvm_gpc_deactivate(&kvm->arch.xen.shinfo_cache);
diff --git a/virt/kvm/pfncache.c b/virt/kvm/pfncache.c
index e3453e869e92..f0039efb9e1e 100644
--- a/virt/kvm/pfncache.c
+++ b/virt/kvm/pfncache.c
@@ -430,6 +430,9 @@ int kvm_gpc_activate(struct gfn_to_pfn_cache *gpc, gpa_t gpa, unsigned long len)
 
 int kvm_gpc_activate_hva(struct gfn_to_pfn_cache *gpc, unsigned long uhva, unsigned long len)
 {
+	if (!access_ok((void __user *)uhva, len))
+		return -EINVAL;
+
 	return __kvm_gpc_activate(gpc, INVALID_GPA, uhva, len);
 }
 

---
base-commit: 2bfcfd584ff5ccc8bb7acde19b42570414bf880b
change-id: 20240625-bug5-5d332b5e5161

Best regards,
-- 
Pei Li <peili.dev@gmail.com>

