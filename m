Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FC68831
	for <llvm@lists.linux.dev>; Tue, 19 Sep 2023 21:02:04 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-656340e666eso26175866d6.1
        for <llvm@lists.linux.dev>; Tue, 19 Sep 2023 14:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695157323; x=1695762123; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lVX+Hnhh2l6DmLPA8VTV6OqmMl0pnzem5EJJPR6Mhqs=;
        b=Dp68MuWbjiGHpcdj3Zstqa/28J8lFkAqqsH/cPKZsFtoUJQjB+kukEDqLvMtnfaas7
         6tBYFwPg3BNy0v0ouCR/L8elEHzwDbhSNxpPIdvrzUT8wIUjSOSGSAAmmlJWgSl4PcHA
         8PqreKjbDMmlrxC4B1kc/bXClWcLP5DYUktpeVUibdjY6O8/OiUzpgnCv4gvKCSdjcnS
         brCNXbwq3oKzRNdpywDCQLmFYbtwXDhPOf47TRUCdxZhlssZKL08H4o75PXY/3wolwvD
         gJrHW0hjU7CtByr/8kLMXPP0dJHM0SPF59ty7k3fWwihWtW9fBiTv/HXLZ5CF42a4t7s
         lVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695157323; x=1695762123;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lVX+Hnhh2l6DmLPA8VTV6OqmMl0pnzem5EJJPR6Mhqs=;
        b=gg+c+MV52nikzLusN/DMQePHLIEBWdFI2nwMV3ZVH2++yAcEfPQneaqccjv5saqu/B
         +ql//x6ACEdhyq9SimJmYdzPziuJtTPqHDnCksKfNd+1XwL+8iNjPq+VW+QCBUXiIJBr
         7S0j3RyEuDC2NJxbZCAJEtt9Z5/Bi2YFxn0gKjpjjLettHaFeUqOBzGuaOpaTjEwcCn6
         glbgm94+C0N212B0HPvXAt1064ys0p1jSHu1zINkb2AWKpSuNf2mlcx+1u9eVGaXftgb
         mfFxQSgg/WbynW3v35r68qtjZgBig4joHeQHc1YWlAI66Yjz9ALkfUxev1IOUh47L/+l
         GG7A==
X-Gm-Message-State: AOJu0Yw78ugGZ2rjalCb38C9s5Amae0MuaGaGzLmP5s9z8woGOOcSPm+
	TJCBlhCb/UnFrzHcpqdxthf1XiNR5V810UqdPCI0FQ==
X-Google-Smtp-Source: AGHT+IEF2ThYM/mz7S/1qqdc26uccov5d1h2ccEPnZjX3XDy4DhRHHjf40u/n7W6FxrxUjiYIrdncY7If4XUxU9Syjs=
X-Received: by 2002:a0c:b2ce:0:b0:656:5176:c53e with SMTP id
 d14-20020a0cb2ce000000b006565176c53emr737526qvf.6.1695157323272; Tue, 19 Sep
 2023 14:02:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 19 Sep 2023 14:01:48 -0700
Message-ID: <CAKwvOdkShCL8MAE+rJzSeAf54=UeHRnuWkHkfMKDeC4A0KoEEg@mail.gmail.com>
Subject: -Wuninitialized in drivers/accel/habanalabs/common/memory.c
 introduced by aa7b6367186e
To: Tomer Tayar <ttayar@habana.ai>
Cc: Oded Gabbay <ogabbay@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

commit aa7b6367186e ("accel/habanalabs: tiny refactor of hl_map_dmabuf()")

introduced a warning that's breaking the build in linux-next.

drivers/accel/habanalabs/common/memory.c:1735:11: error: variable
'hdev' is uninitialized when used here [-Werror,-Wuninitialized]
317 1735 | dev_dbg(hdev->dev, "Failed to map dmabuf because p2p is disabled\n");
318 | ^~~~
319/builds/linux/include/linux/dev_printk.h:155:18: note: expanded
from macro 'dev_dbg'
320 155 | dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
321 | ^~~
322/builds/linux/include/linux/dynamic_debug.h:274:7: note: expanded
from macro 'dynamic_dev_dbg'
323 274 | dev, fmt, ##__VA_ARGS__)
324 | ^~~
325/builds/linux/include/linux/dynamic_debug.h:250:59: note: expanded
from macro '_dynamic_func_call'
326 250 | _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
327 | ^~~~~~~~~~~
328/builds/linux/include/linux/dynamic_debug.h:248:65: note: expanded
from macro '_dynamic_func_call_cls'
329 248 | __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func,
##__VA_ARGS__)
330 | ^~~~~~~~~~~
331/builds/linux/include/linux/dynamic_debug.h:224:15: note: expanded
from macro '__dynamic_func_call_cls'
332 224 | func(&id, ##__VA_ARGS__); \
333 | ^~~~~~~~~~~
334/builds/linux/drivers/accel/habanalabs/common/memory.c:1731:24:
note: initialize the variable 'hdev' to silence this warning
335 1731 | struct hl_device *hdev;
336 | ^
337 | = NULL


Please fix. Also, please post your patches to LKML so people can post
info like this in response directly to your patch.  I could not find
aa7b6367186e on lore.
--
Thanks,
~Nick Desaulniers
