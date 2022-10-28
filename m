Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ABEBA41
	for <llvm@lists.linux.dev>; Fri, 28 Oct 2022 23:09:14 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id e129so6042913pgc.9
        for <llvm@lists.linux.dev>; Fri, 28 Oct 2022 16:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U4IrdAhOzl6WZJXCGAoAMC0P0Rwzt65XlcVJ9HFmgfk=;
        b=Tyo5380VratTmMOXXWrr407J20NrM08w85ky/7/pKXkbuOvBgY6jTNoAh6t2YZF8Tz
         K0Abt8YvwNieHPjyJP2LCHm2PTbgXbfrnBoIENbjRsB7WO16QASrYyJ4ty+EI+3l1arA
         mawu2oC98hftt3flDny7Y8citXK8M3lC3M32Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4IrdAhOzl6WZJXCGAoAMC0P0Rwzt65XlcVJ9HFmgfk=;
        b=G5MvjVxhPkemiSscCu7kqpbPqmMKquQss3AUJsWo4eaa4Z1kFcGbc2l17+v5EZA3L8
         Ac9lVoX67fJK7OVmfisYYI4kSxyDybVgkneuiaeKY9uuN/i+2nHu+gLJBkoTprpMiAOA
         Qm4xfkmwbVELud+sUPJgBrv/SGDmXA/N2q1zteqbAWXmjj9ncU65xlVeg4AeQ6OwjFDB
         eB0xXQZkNSVpe4GIgwBIm3h/81CVjF84OffNCXOiUXRH3SydECM60O0UXxY5ueIiY3Db
         v96YmLJq1Xote+3X3StlyQKi7WFLfEtBZvBJZPIttcArDnSHzqAqa5Gwurifq/ah5Fwp
         LA8w==
X-Gm-Message-State: ACrzQf2RSc1v3YpdsxR2F1oXe87CsT9dfcadJBZyKqQBvyhsccSG8MFG
	mXwSyJZ3pAWdEPyOJ0Aj1xH9Tw==
X-Google-Smtp-Source: AMsMyM6fDOeW1eogpY9ZYVbaFDbU7v3GiXglpMY+RAjkEuTgct/U1F3MV3mRGle7G6iHyh+w3TteJQ==
X-Received: by 2002:a05:6a00:4504:b0:56b:3ed4:1fac with SMTP id cw4-20020a056a00450400b0056b3ed41facmr1585635pfb.73.1666998554059;
        Fri, 28 Oct 2022 16:09:14 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v16-20020a63f210000000b0045724d09cb4sm3147209pgh.29.2022.10.28.16.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 16:09:13 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: Kees Cook <keescook@chromium.org>,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fortify: Capture __bos() results in const temp vars
Date: Fri, 28 Oct 2022 16:09:08 -0700
Message-Id: <20221028230904.never.518-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3002; h=from:subject:message-id; bh=WziSb9dU4dXIcaH6XLEi89nXbfIug55kJJSj4Y2lMRM=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjXGEUvMKYwSHJSpCMmxLWuhbZN5HFWzJWI2Hr/K3x 3Ve5SSqJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCY1xhFAAKCRCJcvTf3G3AJujnD/ 9G+brE7kP3VkFj8Z/r1jei8P3f9w2zzJkRWZo/xNinekD9c5Ig8d/y2EbbZ2k9AClAv5Y352yOpO7M JPuRQ8QYKqbeKa8UgJr/ImUbZOphY8EGXueRRIs6FF4mrzAJoFTBYCJ3adImhrhvIRNuiy+CLp+ItB pr23rYy6ZzeMioceqV37B7taBfbdr/RqcsftCAcf7asdj7MdoTMlj1uWKeE9mYHgMH637ZEe6Xckmn 7EqCdHYTFTRfhbIsXWVaoc+VxeotbM70qr1ALr31k82TE5NksHG6aeuUHipRQsKOy8B6wRg8T6eDwp M0E44++oI1nnbl1kTq6PvEq7GRQ3nKfjTP85QYQHiWeg1iiEbCkVBpG741LQdS2r1WhwHFQjFUQYJL euumQX7NggGZWRU8GpvXzckW+U9g0QpIfIDlm0ytfr8KzM5dxGyR9yl5WOhuB12J7K2lfnTb2WlQGt beuKh89KOi3Tem/vNu+w6wtBwwT2BmD8wNF6zxoTnfobLzZWUzTMTjSkJJTT0CxsRo+Vf7/0xLS4PJ PaCxAsX04ZuTH8b9guDxc17nBGnccXlRQ8TqOaTiPHQLj2K3H2/KnCiRSDnsQXAxamIuCmFgOZ90bP T6DP28U2KKorceUod/kqNV1yY9gzgKN+D/Y5AvLkZvRVGc7c28zmXujClzTQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

In two recent run-time memcpy() bound checking bug reports (NFS[1] and
JFS[2]), the _detection_ was working correctly (in the sense that the
requested copy size was larger than the destination field size), but
the _warning text_ was showing the destination field size as SIZE_MAX
("unknown size"). This should be impossible, since the detection function
will explicitly give up if the destination field size is unknown. For
example, the JFS warning was:

  memcpy: detected field-spanning write (size 132) of single field "ip->i_link" at fs/jfs/namei.c:950 (size 18446744073709551615)

Other cases of this warning (e.g.[3]) have reported correctly,
and the reproducer only happens under GCC (at least 10.2 and 12.1),
so this currently appears to be a GCC bug. Explicitly capturing the
__builtin_object_size() results in const temporary variables fixes the
report. For example, the JFS reproducer now correctly reports the field
size (128):

  memcpy: detected field-spanning write (size 132) of single field "ip->i_link" at fs/jfs/namei.c:950 (size 128)

Examination of the .text delta (which is otherwise identical), shows
the literal value used in the report changing:

-     mov    $0xffffffffffffffff,%rcx
+     mov    $0x80,%ecx

[1] https://lore.kernel.org/lkml/Y0zEzZwhOxTDcBTB@codemonkey.org.uk/
[2] https://syzkaller.appspot.com/bug?id=23d613df5259b977dac1696bec77f61a85890e3d
[3] https://lore.kernel.org/all/202210110948.26b43120-yujie.liu@intel.com/

Cc: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: llvm@lists.linux.dev
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/fortify-string.h | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/include/linux/fortify-string.h b/include/linux/fortify-string.h
index 4029fe368a4f..0f00a551939a 100644
--- a/include/linux/fortify-string.h
+++ b/include/linux/fortify-string.h
@@ -441,13 +441,18 @@ __FORTIFY_INLINE bool fortify_memcpy_chk(__kernel_size_t size,
 
 #define __fortify_memcpy_chk(p, q, size, p_size, q_size,		\
 			     p_size_field, q_size_field, op) ({		\
-	size_t __fortify_size = (size_t)(size);				\
-	WARN_ONCE(fortify_memcpy_chk(__fortify_size, p_size, q_size,	\
-				     p_size_field, q_size_field, #op),	\
+	const size_t __fortify_size = (size_t)(size);			\
+	const size_t __p_size = (p_size);				\
+	const size_t __q_size = (q_size);				\
+	const size_t __p_size_field = (p_size_field);			\
+	const size_t __q_size_field = (q_size_field);			\
+	WARN_ONCE(fortify_memcpy_chk(__fortify_size, __p_size,		\
+				     __q_size, __p_size_field,		\
+				     __q_size_field, #op),		\
 		  #op ": detected field-spanning write (size %zu) of single %s (size %zu)\n", \
 		  __fortify_size,					\
 		  "field \"" #p "\" at " __FILE__ ":" __stringify(__LINE__), \
-		  p_size_field);					\
+		  __p_size_field);					\
 	__underlying_##op(p, q, __fortify_size);			\
 })
 
-- 
2.34.1

