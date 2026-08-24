Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7569E38E13F
	for <llvm@lists.linux.dev>; Mon, 24 Aug 2026 20:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787602465; cv=none; b=a6d4LWAKl6t+OiFu71KWmrbA1KnDzUWcSl6ve5fEf6gd4hQK7cqriPrCYv6EE0OiI2Q3QuyU0vasAeUcqH0YrrL3S1hn9n+kPxI9TBuCWOhBbHvDIp/fwk91XjHRk0AAIGZ6EapOvzHhOJIWolpWrVdsqEQ5FSFvDZ36Lbf8lFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787602465; c=relaxed/simple;
	bh=m4oJxPscrxxq0i2z/68SeZy8svwkKCtvosHLYsFT6TQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KCHVH2NbmDKGYMKvtt11YH9Gxo/bk/JXPmEGcscZPkcyZVV71PQPOFaqR1eeePSisEgqqfEOgcgUc/xJ6uQjA9CHDDEq/VERVQwjxo5WsMEfhs/jEh7UM3eErplzm71H+In67rXxZMels23FgwyhXXt02a6Y6qVtePo0/fJvZrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7PzPgIo; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7PzPgIo"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b2a22c52c1so3703954e87.3
        for <llvm@lists.linux.dev>; Mon, 24 Aug 2026 13:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787602459; x=1788207259; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EmhmgT8VKFfYQHk+qL1AZ/XS5DwXnr8XjJwyeM/eoq8=;
        b=b7PzPgIo3hXnFaeI1k8p1xDw7k9bs/IDB1MzWFLyCwWQVZ7HKVkzHkCsevrxYiKMzF
         qMgrBPuOc3muzDKyo6RSYvX+TgC00KT1qgO0NhY/XKEw7i0ojed7P+b1mgo9ADUP9A5z
         zP0iaY8FATaCfUMM+rSgXBdDKEB6SCvnOuWuThyriPlpTV3DRgeX4WbioOaOccD1qVQx
         pF3NdH+2qMAOuLGbbF6za9DMIEejis12EBjw0pup+o5AsbN8uCnIWoX8zzqp/glGWF5d
         J5sdfNGRSGT6Bfn3TJbdNlKIQhL0k6SX/fagAX0Ye8YQc8t2NsHuDlqyjuUu3g++Fqet
         bmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787602459; x=1788207259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EmhmgT8VKFfYQHk+qL1AZ/XS5DwXnr8XjJwyeM/eoq8=;
        b=mKVpfy5w7XWPwwTr6a/ABPaPaK1f9ZD9bqj7PWuO4TFc5KQPsfzFQz6ZoUSkUL5ujn
         D9Oj1qW+LxbqoDU1evmz3CYeCju6rlkois3jJGV45wlz8J+2stmlWFh/g0ZDnGmXJNYJ
         AtVa5/gZW+KVBZ8rfucsBPmX7YxlUfT5jOlSDX4Pa6ovxGqeKtHhvUgVf3iPeLOJBTFg
         n4N6I1/WVGRjzVPbes1/QzgUEu1Pc5Zpsz9LCOara4huVIFagpXfDC0yUdfhICyOWQnu
         FLWW8H/FSsXhSudcxQyhghIbzyVUtioz12C4Dsv+3swoovvnplhZ++4YErbt6e7zng6q
         eKPw==
X-Forwarded-Encrypted: i=1; AHgh+Rr00XA7zJGLIIvNxFbj/kf8uXKrp6M4ZWXiybB6MBdmh3aYgVHbPg+6Jfoy2TF/o1yO/1AP@lists.linux.dev
X-Gm-Message-State: AFuF++nUYSJWe+5BEknzryJnW2MJpoMtSDnXOXxh3/aLqrqtTM9n9q99
	UROVtW4Vwn1fF6bpd4w2Y6ragkeoojyohXoCCcCgO9dh81hJtoI6xwJq
X-Gm-Gg: AR+sD12rcLe1kHID0jCIpIRWVDYGjNhvyIovJhga0JjWpYEx7rFbjSqlBGoRz1WnH0S
	KRqqsoZ/sslg3KIwofyzoeJXSTKDIBAFcj7KLC9m03uG+Ctl5xF9S7jl3nK97Zsbcy3RTCjd3wc
	XTdVz6Ed2phIR7gt5NKDpIfjfYprORZySuM00BsyF+DtOQqWttRa14Ic+Z7FDkyVDZgDcQ7txxS
	BFcuY6sqZvZZ7DPIMSf69ctCpqOR5zbQ0WxVXZpcUX9aTuTWovnTRUbkDbOqyjQxZIgoKZB5Tsi
	atJpoxJO/5q9qKcj+4oNUvhwN0/lwW5eYu85PrGudp0De81LGJ2P/himgnkHdaF9sJMkhOQyvw2
	7SD0dy4n2ZhAxlNjteRRXKpXgyK4gET5STui2GyGcuwYUEhUi3SPfb0kWpBk21hmoi7vuYZnQYO
	OEFSTkwcQjSGA7EhrvwGW5d0YdD+CZpkHFG/HYofro4yPlxsBwcxq0TXDQWJ55FHSoltioNR6kp
	8cOJQeX8v1tEP/AtgV3d7Xk3o7bvm9oPZesdpAURugDOFznrW5z62iwAsg=
X-Received: by 2002:a05:6512:2389:b0:5ae:cee7:52bf with SMTP id 2adb3069b0e04-5b48b67eed9mr5722292e87.9.1787602459341;
        Mon, 24 Aug 2026 13:14:19 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b48ce0cd9csm1923620e87.71.2026.08.24.13.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 13:14:18 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Jonathan Cameron <jic23@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH v6 6/6] iio: pressure: dps310: check the lock markings with context analysis
Date: Mon, 24 Aug 2026 23:12:03 +0300
Message-ID: <20260824201203.396651-7-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824201203.396651-1-zoone.rupert@gmail.com>
References: <20260824201203.396651-1-zoone.rupert@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__must_hold() markings added earlier in this series are only
documentation unless the file opts in, so switch the analysis on for
dps310.o.

Clean with clang 23.1.0 at W=1. It does run: dropping the lock around
dps310_fill_scan() fails the build rather than going quietly.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/pressure/Makefile b/drivers/iio/pressure/Makefile
index bc0d11a20acc..4b1a05f7a0bd 100644
--- a/drivers/iio/pressure/Makefile
+++ b/drivers/iio/pressure/Makefile
@@ -3,6 +3,8 @@
 # Makefile for industrial I/O pressure drivers
 #
 
+CONTEXT_ANALYSIS_dps310.o := y
+
 # When adding new entries keep the list in alphabetical order
 obj-$(CONFIG_ABP060MG) += abp060mg.o
 obj-$(CONFIG_ABP2030PA) += abp2030pa.o
-- 
2.43.0

