Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DB714A629;
	Sat,  5 Oct 2024 13:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728136382; cv=none; b=ulmTQJNxdyceiam34tknIQEcXyNuAC5jt9sb6mlBnxQFQH0TL2DUljXFh54sHuCOkoDJmBrV40cwyu3BxdIwKIJ31q8AuemA2aD1VFHsiNzlWATxaGg5U7XShC9kq1fc062j6ujLAO8eb9krtU4E4jvcUbBLVUnZcq//wGkwMpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728136382; c=relaxed/simple;
	bh=Ajlem6k/uodZKw91vdPW9aYla6FAURsqWh/JStw+YtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bqPAlRC7kdpiASomOZ1drS+Y615KEWttwU76hRlWw9RD8GdRTNZl7hDgq0/GHFDNlQpI0IU0OHpD5RKLCmvB8JlKJDNtoIpu8RgumnwxI00RKKxcgnTFpcup5jekPktGpyhqMTHOwKTP/LYd1KSfFIx5JKgb58HS09CHU0xN6cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a70Vb7Pq; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a70Vb7Pq"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-7e9f8d67df9so480924a12.1;
        Sat, 05 Oct 2024 06:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728136380; x=1728741180; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QbLT/T70VsNnTE26uE1848ixYQonI10aMF4BdG+3s58=;
        b=a70Vb7Pq2gIwvTYPmusZu8eM3ZjwzrxT7doQNkhb4JSZV5Wtv2WnfV00efaKJiqN8J
         OrGOfoqEeKd4DGy3OBaJCCHvNBdvWIhLvlRsb1Vtj44OrBToWo3lJEBBbmL6vsnHpxwA
         PzFC15cE+J1xlCB3FRrAWXDRAC4uKlFYSyg38a+L/X11pfYCVXiFZ7rs8x3o/oG8cmVJ
         7fbYwqABW0JDhTQF9jfZzHjn1x+oWP/QN4h9SIVVQqtD55QLb6ftS9J6fockC4XH3UXL
         qIf3BLQK9xH5xfqfmZIKZGGYv+m71nvI0TCepe/zjvC4h86sV1mu3j37/ABfJYl+O6VA
         Cjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728136380; x=1728741180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QbLT/T70VsNnTE26uE1848ixYQonI10aMF4BdG+3s58=;
        b=J0XVAEhRbOKjiWvnr7crwV8WkPZkd0dhUZoSEqq/kP5caAF3Usocj7vvFfR3bO53vS
         yuzDSzgPZC5EI559ZhFMgnZJYbb6VINpWT+BnJ2IX5Q5hZbtBxfrH4FizRopUruYFDDO
         jm1Lbl1Psch0UxCiyJ9pNItehrwY7xfGxhveeUDO9J/JjfPsddWEPQvCsjoCwSzqx/jR
         xP9daA3HZLFU1TSL101Q27lDQCcWBWtQ39TN8pXJ0HwN22uj+0KgWT9BrEOWE1aAgHOb
         wQqi6mTGLeLoOyrHYtUavxcVeJrimU69njWdiVqGVvHVRAWcQ7Gp3GvokJY8BK2Poqo7
         V9FA==
X-Forwarded-Encrypted: i=1; AJvYcCVb6W0Wj1KJJ/jyapOwsJw13joM2xfs37R0LEepd0MEgXJ67GPoV4qKYZPdL7l8Lg6Qi9XU@lists.linux.dev, AJvYcCW32vQFZg3XhdhDpqmdtLWOIn5taU+/waX/El85G1REdSdEr5LmCkrDRqvaselVWcpEjz7qLM6TN14SNTx2TA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywxvu0FJDC2rIbIuHK13wYsMfLkTtl1x/kDqRsQTBxjXKvIvYFj
	GYwaKT6N7S/tor1RnYc6Y0kcqIynbgHBXnsavhh5ECSQtm03LI4n
X-Google-Smtp-Source: AGHT+IEOU8ZTa2vAAW1GLQr/bRHJ0H4/WNcbceO9WPtKl6744NFNbN4Rwpw7YmJHr6dQ2jTZ0UyRzA==
X-Received: by 2002:a17:90a:ec07:b0:2e0:8095:98d9 with SMTP id 98e67ed59e1d1-2e1e6222221mr6574534a91.11.1728136379993;
        Sat, 05 Oct 2024 06:52:59 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a74:2681:86c0:b921:7e4f:199e:c149])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e1e85d959dsm3576169a91.26.2024.10.05.06.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 06:52:59 -0700 (PDT)
From: Xiaofeng Lian <1198715581lxf@gmail.com>
To: lkp@intel.com
Cc: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	stefani@seibold.net,
	Xiaofeng Lian <1198715581lxf@gmail.com>
Subject: [PATCH v3 1/2] include/linux/kfifo.h: fix some IDEs Intelligence errors
Date: Sat,  5 Oct 2024 21:52:49 +0800
Message-ID: <20241005135250.121964-1-1198715581lxf@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <202410051712.VDmFpiVZ-lkp@intel.com>
References: <202410051712.VDmFpiVZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

  - In some IDEs, when using the ARRAY_SIZE macro to calculate the
    buf size of kfifo, an error occurs (using incomplete types),
    which belongs to the compiler INTELLIGENCE reporting error,
    and can be compiled normally, specifically due to the gcc
    compiler's __builtin_types_compatible_p function. Because the
    KFIFO_PTR type uses a zero-length array and the macro definition
    is a simple substitution, the ARRAY_SIZE macro will report
    an error because of the zero-length array when calculating
    __kfifo_esize in the INIT_KFIFO macro. Notice that the difference
    between KFIFO and KFIFO_PTR is only whether or not the buf is inlined,
    so (sizeof(KFIFO) - sizeof(KFIFO_PTR)) / sizeof(type_of_kfifo_member)
    will give you the size of the buf of the kfifo, which bypasses the
    compiler! Intelligence and bypasses the possibility that
    ARRAY_SIZE may be passed in as a pointer, resulting in a compilation
    error.

Signed-off-by: Xiaofeng Lian <1198715581lxf@gmail.com>
---
 include/linux/kfifo.h | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/include/linux/kfifo.h b/include/linux/kfifo.h
index 564868bdce89..66eb1b8971f7 100644
--- a/include/linux/kfifo.h
+++ b/include/linux/kfifo.h
@@ -123,6 +123,21 @@ struct kfifo_rec_ptr_2 __STRUCT_KFIFO_PTR(unsigned char, 2, void);
  */
 #define DECLARE_KFIFO(fifo, type, size)	STRUCT_KFIFO(type, size) fifo
 
+/**
+ * get_kfifo_data_type - macro to get type of kfifo's member
+ * @fifo: pointer of kfifo
+ */
+#define get_kfifo_data_type(fifo) typeof(*(fifo)->type)
+
+/**
+ * __KFIFO_SIZE - macro to calculate kfifo's buffer size
+ * @fifo: pointer of kfifo
+ */
+#define __KFIFO_SIZE(fifo)\
+	({\
+		DECLARE_KFIFO_PTR(__tmp_kfifo, get_kfifo_data_type(fifo));\
+		(sizeof(*(fifo)) - sizeof(__tmp_kfifo)) / sizeof(get_kfifo_data_type(fifo));\
+	 })
 /**
  * INIT_KFIFO - Initialize a fifo declared by DECLARE_KFIFO
  * @fifo: name of the declared fifo datatype
@@ -133,7 +148,7 @@ struct kfifo_rec_ptr_2 __STRUCT_KFIFO_PTR(unsigned char, 2, void);
 	struct __kfifo *__kfifo = &__tmp->kfifo; \
 	__kfifo->in = 0; \
 	__kfifo->out = 0; \
-	__kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : ARRAY_SIZE(__tmp->buf) - 1;\
+	__kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : __KFIFO_SIZE(__tmp->buf) - 1;\
 	__kfifo->esize = sizeof(*__tmp->buf); \
 	__kfifo->data = __is_kfifo_ptr(__tmp) ?  NULL : __tmp->buf; \
 })
-- 
2.45.2

