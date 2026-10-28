Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158309;
	b=AV4/nJcGiJ/UqGA1X7FqUI9g5GYZ6vQP2iITNqlitqA5GU8GxIbeYjIBj0B5tbSHqAoB
	 W54htAFr6thZNXgJN1CxEZ0GmZapdk7lQuQYMTFsK8it2MEaVsXqxOuscXW8P9l+EoSQa
	 Ip8uqdBNXIVwuXxfvwpLH8EVz4sdkRR0/4cNOS4L8XIdkXHaBOBrS+Crvgvd+Xuc6jFHK
	 hu2iiV8S8ncZm7c9ebv3NUERCB7/wxGBz9dv9QUz0s8N06OBEai+es6xOhx688RBWJ6vV
	 GCwLi1w8uPK3QuEFJ4X2jCUobFezTAUzOugDKpCqWcn19MFi3hMYbjFXzDLyb+L9puQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XMTbYYVHlMzt/kOSKupfitaPTvvxuFfzu7jXp67o424=;
	b=vU3Mg/7upCXFkhr2JF3p5ENj2i1Qlzm9TXpoxUUY1I35Z6OCWyrrz89XdGm0BMA9+1po
	 dJS/S3a4YqCtMFyqYMQwMc34HygC/NfDGsXw1iBGUzFvZGxrW5rIXutkdm3UfGzQHHxXH
	 wkn9wa33F4MDacur9losGDY9cPZFoojzXlKQuG0lDoLUp0x/Heb4kRuBznczkgH1TBj9X
	 K3eqmFhj9c0h57xARtalM4ThzQWoOQTg7dW6Xg9AI5pDb43Bvc6OurdUHkVTCIyEq6Kdi
	 6nehOa+lBHDWspEaiVHAteFcNVykUN0TiJej3V6Z9dp7Ogfr9C12HOKTNqP48IwPibg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLztBbfI;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0AB606A323
	for <llvm@lists.linux.dev>; Wed, 28 Oct 2026 03:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF0AB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLztBbfI
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so402994f8f.1
        for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 20:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158307; x=1793763107; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XMTbYYVHlMzt/kOSKupfitaPTvvxuFfzu7jXp67o424=;
        b=lLztBbfIGaL36LzVPU1Ew9FFjbkJh8PD/DqXXgAmTl7YQ7PM0Ey98j1hUZf12JVqsF
         cgoTfp+MwLOkdyqZpF83Lmal2TsY2tNLMi/tMAnlEKkeDubHBOfpXEu3phN3Her9Oita
         g7QF7rGE3+stcOrIrNSXukQM1+HG7iIWTGbxZeE9RCYZlpVebM3hlUOKSbdWwOmD3b/B
         K/tpe8oGg1F9tBL8BW8dY/Y4NPTxRwaGhJIcrkZ0QYQuphDb+J2iYO6Jcs1v9rQq1ZnD
         M8thEv5UXWPSAjlEJEBGulm0kEEN0ySYryajL0QrFRvBeRI+EDASHrKMOLr7bcRrfr26
         FgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158307; x=1793763107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XMTbYYVHlMzt/kOSKupfitaPTvvxuFfzu7jXp67o424=;
        b=XhoAsRnaVctKoNhmAEfc3Tjl82JclUelqGuzKN3c8BP3koycwUK6nrWiRBTVjmqOCq
         7UocDAfgPqW2m1Jdk0mlwOBWeESM+tmqARqPpmZGnXyURfoZUEFW2y1dkms+iMgmP/bC
         w/xlP9axRa2/VmzkxPqTgmMSwXWQq1F+kKTrVUW6mKRcrzsQ6SyxTaAAJfmidlJ7DAdk
         CgYll2TDVq7lpLyYKYF0H77ZkmtcYRrqkJM41Kn1/UsjAEHtzdQsAlDoyGQ2lKFZZJLV
         Sfh5P4hihJXyLCfrSrgkRIlKy4vSwIRq/5u2siH05Zy7c9TPWElyDV53J/p3QVmy6vBG
         8BNA==
X-Forwarded-Encrypted: i=1; AKwUvBx8IhenqeOr3xQ725/HPHvRcK+6emclcTN6D9vuEpsuLD/GHxa3uwUTjhHQrR6OB0xhwbBk@lists.linux.dev
X-Gm-Message-State: AFq9FYIexwl+D6yP66AAGeggCwnnp4rA8qsi0fz0ix8vo4lxsu4mpJ3y
	ADGaAFZs/EUWXrA5/GLmSTonKC2iaPByGgYQyZuvIHjBiXUcFiu7mFmV
X-Gm-Gg: AYBFou0dTx1CfAXJSM0+JJvxLF4LkbAPk3K6O/82Wduwq5eMUbf3PqHcwl3cjtqP6vQ
	sFMXVqoZgqfipz/yUOe4PD/JtoRw8GWo81x1zqFujuIPyylXJqaHKU4ldfDUFEdGFudg2MPJZb6
	QD2w4PybRYPhesUuBstIqs1nTkq5MKzZcFP3DoyMfXRRey/dHHbYqHY+SQhHgR0LgruhtCmpXYQ
	jht2SMK7K8aBOeiLPRxARiYUNrizockHrSZ5LHbRBHh9kG6uCt7uPCf6qA7z2LNRkww7fwnlnkR
	rMRhby676vCUkawUqRFSg0rKFdmTQwnxLWhFJNaJxMDXftlI/a7CJ1jyrga4zh1HBSrHrwEBgR0
	a536G8jedZzwYYPaP3P3IGDZgLDjMraG6vjmaxJzlFG+JYyCYdJTyTcKbOdsU2Xiwv5GHOD8zHq
	GVW2Bz6OFfQtNtMd2yaEWOBZ7xz0DoZt5+ozi6Uj07wLNr4aljYND3coHvFhfMSeJVMMHEri3ca
	YQU2p04KAkdEYENckVuPdPZvrcUy1uJi+s4SDnG3ws2ZkGUKHW97RpHVprHnXmElagTgCO/LYAW
	RYdo8BGEzgTmfhXA9mBOwLiTpc6DL4ZptAkTYSk61jvKO2CSgF4H9FGa72gTwcU6mvdbG7mpi2j
	oXu5XjSieoh8j5swbrXYVwFJz8fss72vW8C0Z7DvIpupeIogS2zlZibIOwwDhcWyRpSwHsMLaLs
	sTpwIx5RsteoY/SbcQT/NqK4iCi7kQwXyyLtyy3lYlfNRbtsZdbuU1xg==
X-Received: by 2002:a5d:6f13:0:b0:48e:4e00:b737 with SMTP id ffacd0b85a97d-48e5d56d4fdmr2944765f8f.54.1793158307173;
        Tue, 27 Oct 2026 20:31:47 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.31.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:31:45 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 02/13] arm64: percpu: Annotate __kern_my_cpu_offset() as '__always_inline'
Date: Wed, 28 Oct 2026 04:31:16 +0100
Message-Id: <20261028033127.82193-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028033127.82193-1-kmehltretter@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Will Deacon <will@kernel.org>

Allow the use of per-cpu variables from noinstr functions by marking
__kern_my_cpu_offset() as '__always_inline'. This will later be relied
upon to detect stack overflow of the overflow stack from noinstr C code.

Signed-off-by: Will Deacon <will@kernel.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Link: https://lore.kernel.org/r/20260918161407.2300-12-will@kernel.org
---
 arch/arm64/include/asm/percpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 3cc316091d665..105f659bf8061 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -37,7 +37,7 @@ static inline unsigned long __hyp_my_cpu_offset(void)
 		    "mrs " dst ", tpidr_el2",				\
 		       ARM64_HAS_VIRT_HOST_EXTN)
 
-static inline unsigned long __kern_my_cpu_offset(void)
+static __always_inline unsigned long __kern_my_cpu_offset(void)
 {
 	unsigned long off;
 
-- 
2.39.5 (Apple Git-154)
