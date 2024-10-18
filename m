Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A7A1DFD9B
	for <llvm@lists.linux.dev>; Fri, 18 Oct 2024 13:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.46.229.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729259358; cv=none; b=NORzQy1G/UOIuCFfvOnwxn4+He74D97MrXWGYEPHQYwTCm1uo04p0OE9yfW+EiMtja04D6qJsjhrMZQXpZuT5VCBu6/xklCSvzuv9GsQ8mCh2jVKjhwqClwwEqcJ5uYWJiiKz8VRVUOhzQv0VI7DRBtWfH/K71SBfyQOaKE7Fic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729259358; c=relaxed/simple;
	bh=WMN500FkcCksA8b8kjayGiuGQKSoRSU7nonRd9vIpOc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nj+btpnOviSvJvor3Yy6sqyPYY07I5+wRrf8sB0ZngQ1gfONlm0o4TM2FrTDWWsdXOAhKNdsHfnWcWL8rlr1Kk9wEx5W23btbTU2JGmx/hKvDNgjyXT3995U8xsX/yb2b7uNER4G21XpV1LblPQYnIYfuelZpzbgL6+ihdZVBxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=207.46.229.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrAAnL88tZxJniKkYAQ--.5039S2;
	Fri, 18 Oct 2024 21:48:29 +0800 (CST)
Received: from pride-PowerEdge-R740.. (unknown [222.20.126.129])
	by gateway (Coremail) with SMTP id _____wDHGAwsZxJnn+VmAA--.4455S2;
	Fri, 18 Oct 2024 21:48:29 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: si.yanteng@linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: hust-os-kernel-patches@googlegroups.com,
	Dongliang Mu <dzm91@hust.edu.cn>,
	llvm@lists.linux.dev
Subject: [PATCH 0/2] Add the translation of documents in kbuild
Date: Fri, 18 Oct 2024 21:47:51 +0800
Message-ID: <cover.1729259177.git.dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrAAnL88tZxJniKkYAQ--.5039S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvdXoWruw4xWw1UXF1rWr4kuFy7Awb_yoWxuwbE9w
	1kXayFywnrGFnrJFWkCr1fAry09an5Kry0qFn8t39xt39IqryDGw1qqrna9FW0gF42kryf
	Gw4vqryfXrnrWjkaLaAFLSUrUUUU0b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbmkYjsxI4VWUCwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
	8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2
	z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kKe7AKxVWUAV
	WUtwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AI
	YIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI0_Cr
	0_Gr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1UMcvj
	eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04
	k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sRiZqXtUUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Since llvm refers to reproducible-builds.html, so I create this patchset
and add the translation of these two documents

Dongliang Mu (2):
  docs/zh_CN: add the translation of kbuild/kbuild.rst
  docs/zh_CN: add the translations of kbuild/reproducible-builds.rst

 .../translations/zh_CN/kbuild/index.rst       |   4 +-
 .../translations/zh_CN/kbuild/kbuild.rst      | 304 ++++++++++++++++++
 .../zh_CN/kbuild/reproducible-builds.rst      | 114 +++++++
 3 files changed, 420 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/kbuild/kbuild.rst
 create mode 100644 Documentation/translations/zh_CN/kbuild/reproducible-builds.rst

-- 
2.43.0

