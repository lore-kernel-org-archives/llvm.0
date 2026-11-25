Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587374;
	b=SJi6ASAesxnybBE1VVhbRnTt9HZ0skB7GBLt1GnnX/kCx8sfOe8SFJbQnBmO0snCPJg0
	 RiyjeR5/Pb6yUugHDTl1SPheZYILeryh4EP7JRHCR4NuekDlDQQ+NcKwVORNgJrvX5MCw
	 n0pzYfWOeeQZjMnDwQbD4j9q5q4Y/M/kT+qr8m/QudlYmnN9mXU66KQl8YST4Wjrh7lHN
	 A6tDvVwIFJTKc25c2Iqh8ulgMdGWGP12TbXQVNkvYHqDXlAe4vqBrTidgBUmrePR9lIZV
	 bOu+cvef9MSZf8ju178LHvXgBDkflwFJaqEEQcX4EVMDBG32IpGYJTL4qMG+V11fTKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=+3YNbw7npHYIz6vJpu6w5t/t1EQu1XAkIQnaB2DVcXE=;
	b=bpsReEK0Pe0rP8GPX2QrleONR8s06zT2hxIfl1fNVo1QiPBP4MwGp98+lgoZUIzJDdoQ
	 k2C/rK2tgcDce016TWVGvpAUHFtZBN1KbW25RTKU4dRh+828r7Q76nLy1eLuMVWQsoGuG
	 6EmBxIgLYtqmz3+JIXRprI92ra379KycgRfoL6chFZQ+HC4rFvlyJixgrII3fn0+K1Eo/
	 6ePLS999ZJ9lLc0qi09v4kwP5ttRb6gXJnhoN2ktcSVe8vhVfgvqBuTsBBGpA/3SDuHcn
	 3MS+RVOU42oe92ADjYCB1b8GQt+mBJdDE7utvaKfE20zDjfNX1rk5VFootRTL5lfsMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d4klhVga;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0740D60A263A
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 06:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0740D60A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d4klhVga
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-383ec96a7deso6021398eec.1
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 22:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795587373; x=1796192173; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+3YNbw7npHYIz6vJpu6w5t/t1EQu1XAkIQnaB2DVcXE=;
        b=d4klhVgaJDWC1YT66PV8x1JrKG2O6O6zJg1l3jM/5O7bM3Ma4rpboGY++0VbuNusHM
         tFdRfXlHvYvNp8UeIujgMPTlgyQcGoflppk7/Vh42QwPoUMK+rItLf2tZRxM7H1SZI7l
         R+p0inX+8uRSA76UWPJUds+Jl1Gcm+I4IEaRamMsVh+hH9gN3Pax0BdGBVDB4i/8lPRY
         0g/IB5Vm4Bcq6O+2cIuBAfejcaHzCjphsJrE8GoG8eHb5yRUZKBK/W/ZO+TrR392BB+d
         I3ykHTG0Qulh9xovkX13SeQW0JCZF82s5KoskhFAMlp+rNrkW7kuuTzijQYmPSnSROUd
         LApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587373; x=1796192173;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+3YNbw7npHYIz6vJpu6w5t/t1EQu1XAkIQnaB2DVcXE=;
        b=svu0XAcMqjMUqqzBF0Rcnw+el1BMydCXwD1Cf4Hufcmwt4umM8q8/xoiX11Yjf5KBB
         2uFOXNCGhwmqAelmvE9pGjL/Wc8KzxAYGEOWqt8TWrJqYY4lX87RdpY23UgIXh9IKDxn
         vOiaxJBv96zmPqpgM0Q9lo7HcHnvn668DlS3GnGI8tfFn5QciGPrfEwvENT4IfeQwJjx
         vBjk3L5mZRMJ8NbpT5ADIlam4//7V3W0b6UEMmoCIpm1LfMOVZjTuFwmmMSF9rY7GB13
         RcsHXklz1jUBnyYlFFJ61SjzaZyrVIbnnFizs0Bk8vbhlfIptpCP/UzA8sWhPNkouRvV
         6jyw==
X-Forwarded-Encrypted: i=1; AL+hErHiPbIOUqhLdHZPrtn8GblHb8LK81V1mxZsQPoGotTZ+cwqGTyhH8u33BqHMVGKNX9/knXv@lists.linux.dev
X-Gm-Message-State: APuU4Z/14IWm6X8shiC1XoM8vj0WH7e1FjRq+0yyISqcB5huQ2aHyaK5
	ZP/3sf2yqOYt6mNMN90Lb2qc15g0wFjxoEYcKwJjOaxn//2S5JUoHraUUnhlIEe7FD6PPbBuZL6
	EnuRj3xzcBQ==
X-Received: from dybou2.prod.google.com ([2002:a05:7300:e5c2:b0:384:c70c:3c65])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:d809:20b0:386:b070:6f1c
 with SMTP id 5a478bee46e88-386b0707151mr8742111eec.21.1795587372849; Tue, 24
 Nov 2026 22:16:12 -0800 (PST)
Date: Tue, 24 Nov 2026 22:15:01 -0800
In-Reply-To: <20261125061523.1540234-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125061523.1540234-9-irogers@google.com>
Subject: [RFC PATCH v2 08/30] vmlinux.lds.h: Allow architectures to emit
 custom RO_DATA sections
From: Ian Rogers <irogers@google.com>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org, rostedt@goodmis.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardb@kernel.org, linux-efi@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com, jremus@linux.ibm.com, 
	wnliu@google.com, dylanbhatch@google.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Add an optional ARCH_RODATA_SECTIONS hook inside RO_DATA() so
architectures using runtime .eh_frame / .eh_frame_hdr kernel unwinding
can place unwind tables inside write-protected RO_DATA without leaving
them in unmapped rodata/data gap pages.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 include/asm-generic/vmlinux.lds.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 3eb732942d69..1bde7a2a19d0 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -472,6 +472,10 @@
 #endif
 #endif
 
+#ifndef ARCH_RODATA_SECTIONS
+#define ARCH_RODATA_SECTIONS
+#endif
+
 /*
  * Read only Data
  */
@@ -554,6 +558,7 @@
 	RO_EXCEPTION_TABLE						\
 	NOTES								\
 	BTF								\
+	ARCH_RODATA_SECTIONS						\
 									\
 	. = ALIGN((align));						\
 	__end_rodata = .;
-- 
2.56.1.831.g720f3f5937-goog

