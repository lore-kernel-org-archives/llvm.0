Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738181;
	b=fesveEjlSy8d9hb6OvcpRAR1bhJ6OMB5TEbdMB8fg9/kSDg9rRIuujkiD4HZ4Ubz1DKk
	 yu+ORLMeBG6YBviiiPuCFNVvfe04p4mnU2tI/kZ16RqSy9EXtao2TTcE5ugm6kY0kMQZa
	 3DO9WahX8RQbY9JEprPlKfKrXMBoxZ0uatSjBudImPWzA5hqPAf9aqUNUkQcoV3lVuSBF
	 voRnYPE90lmufHzS1gWmpGsaQT0jm/c/x9AvsxQsrIqEhmC/gas7BuKWsrXPkqUJWGBxd
	 FUjaiaRV8k+fdcDPS06nyh3b7+aN19jkhDInUMsUZ9jw9FVVQkn9s4Wjw9otLwBUSWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738181;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:X-Scanned-By:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=NTq5B2Hm0FOnw+vWb0Xc3ff/4P/VqEFyOk2WyaUnR5I=;
	b=kFKnbF3OlIywYeX32XXqszpyaWW9qyTHNfDbWbrN46cbVrK8m9+K6eO5lXLT178iZcp/
	 irxAM+z4uG0HiS3LLQJaxIWxZMrwnsfJG3LGVbfJ6ptQmKrkPSb+1H3Sqbf9C4A99ggYe
	 ih51fygAXbzdvrwvpLsjR3sFlIycmYtYQh2mBcaizObOVoe9/ZkqKQGHcg29wTfbkQUEL
	 zRA1Lu2UwgMxGzmbGw+/OhOS5VoJRkKd6uXorDTBEuH+5lZDeTbRP6kwRUAFdAlYDDpr6
	 zz/a2GHa5h/Mxe9x4029VynHJI82eXz2FdKweaED/9hokgVCVq7KNkxE6CnXqAaBGkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="YJSaAL/l";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CA8606A32D
	for <llvm@lists.linux.dev>; Fri, 23 Oct 2026 06:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41CA8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YJSaAL/l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792738180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NTq5B2Hm0FOnw+vWb0Xc3ff/4P/VqEFyOk2WyaUnR5I=;
	b=YJSaAL/lzAFeXn/D2SD+31SrXN2JOuGFY9r2uH7wFhY64TK8pCC9+KBs1TUWzzMBz31QXc
	0tTohRcOrEnjNtaQTHBPrxnsUYWw2FbniluYNWIndvbi1n1tH5R+sv+YwHnmHoGZ7uRv9L
	qkiAgcaUSZ8RXrhu/G5Y6zInyef6wMI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-462-Tk87mULwMgur0MjOnfTSaw-1; Fri,
 23 Oct 2026 02:49:33 -0400
X-MC-Unique: Tk87mULwMgur0MjOnfTSaw-1
X-Mimecast-MFC-AGG-ID: Tk87mULwMgur0MjOnfTSaw_1792738160
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1A65F1955F05;
	Fri, 23 Oct 2026 06:49:20 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.48.42])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0B2AD19540C2;
	Fri, 23 Oct 2026 06:49:15 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>
Cc: soc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	devicetree@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 01/13] of: fdt: Replace __ASSEMBLY__ with __ASSEMBLER__ in of_fdt.h header file
Date: Fri, 23 Oct 2026 08:48:38 +0200
Message-ID: <20261023064908.66707-2-thuth@redhat.com>
In-Reply-To: <20261023064908.66707-1-thuth@redhat.com>
References: <20261023064908.66707-1-thuth@redhat.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: mI28fkFVZPtn2z5xH_8eZ3XrURCX3CZwcLb0MAhqUIQ_1792738160
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

While the GCC and Clang compilers already define __ASSEMBLER__
automatically when compiling assembly code, __ASSEMBLY__ is a
macro that only gets defined by the Makefiles in the kernel.
This can be very confusing when switching between userspace
and kernelspace coding, or when dealing with uapi headers that
rather should use __ASSEMBLER__ instead. So let's standardize now
on the __ASSEMBLER__ macro that is provided by the compilers.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/linux/of_fdt.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index 51dadbaa3d63a..72b452e388eeb 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -16,7 +16,7 @@
 /* Definitions used by the flattened device tree */
 #define OF_DT_HEADER		0xd00dfeed	/* marker */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #if defined(CONFIG_OF_FLATTREE)
 
@@ -103,5 +103,5 @@ static inline void unflatten_device_tree(void) {}
 static inline void unflatten_and_copy_device_tree(void) {}
 #endif /* CONFIG_OF_EARLY_FLATTREE */
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 #endif /* _LINUX_OF_FDT_H */
-- 
2.56.0

