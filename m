Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF6B6AA2
	for <llvm@lists.linux.dev>; Wed, 30 Aug 2023 18:46:52 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-76d80d35762so935985a.0
        for <llvm@lists.linux.dev>; Wed, 30 Aug 2023 11:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693421212; x=1694026012; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jtmtDXgxLWntTBR5Adpk/86nj2JIFqfGbY1o79Rm09E=;
        b=VwIs582FtwSwhkw24fDEoJp51liElsbNNKgu+muxGxkq3BPkmH1C+/nS4AmdGR6tbY
         xBnjyXHucRwHeryLp2F4ThAoBekMSPytR6Rh+HzMdpJDLs4EjRcB4VRWkd29CcgoawXa
         NL4bwfolL5iZBbdKHJBFRL79oG03z/4LnIFoW+IMKUG7xIGexaqoCyGYYwXpKbfkqx94
         wHmRtrFpFw9FqAAp2xAKmvlo6ok3nKrNr4oPDwZn36yrV9ipX+Nf4m15tTxyirIDvM6l
         VJMJ7unllua6n+eJVP8+fAeuO8leHgPpLOnoToC42pVhrx1tVfCF3uh1AUsyHccdI37t
         6/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693421212; x=1694026012;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jtmtDXgxLWntTBR5Adpk/86nj2JIFqfGbY1o79Rm09E=;
        b=Vk+NhzGbVpGqkd3uu7wg/q7xU09nYmV/hHUlF+IGgNdbye0Qkgmi6JtC+6Ys4030Rr
         eYqZsTEv0QX/5ScHn5qBctP7akg75SukR4suMdphfZTNcMYC8mlPso+xXDGuxNJCD1fA
         TT/yl4MtEXvlhPjOOJ4BznQ8bUN/yO2fL2Mva0aHO2sLXLBgo4ct9Tw/AgnB7Qr3ziXC
         qD+ij7D+BlvHwnBHON+jJX4WBbz9yBOpXWCIToY7pdJ6CpEivKTb0el62FYi/41mLdGm
         GoxI2QZfFIhdhnyI22DrIb8xp4E3XyPbBiuy+LvAXRdxEwMyoDsVpvLK8mmpXijC/Ief
         goVQ==
X-Gm-Message-State: AOJu0YzYHFwublkj//En1Hxtjr8JQTRRtCse0HfJK281MHZnlOj11lI3
	RlN9f6s4A+PsZGrty+Ad7KtluqFxDCBE75tXRPE4E3nK7Oxly58ToNp4HA==
X-Google-Smtp-Source: AGHT+IGZd7iFjXuBrqN3NA3UT1CG+e0iZX3S7dp4+vaXcvmTZ3LNIXUEJ7OK48uAuz6OLYuI9y0XhBo4xI2JU4vIC/4=
X-Received: by 2002:a0c:e287:0:b0:63d:3bea:f663 with SMTP id
 r7-20020a0ce287000000b0063d3beaf663mr626995qvl.47.1693421211669; Wed, 30 Aug
 2023 11:46:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 30 Aug 2023 11:46:39 -0700
Message-ID: <CAKwvOdk_GVOdT==9=X=+s=xaD4PrvwXWoKePNJJ5WRmYHkrTqg@mail.gmail.com>
Subject: RFC: blocking posts to the older mailing list
To: clang-built-linux <llvm@lists.linux.dev>
Cc: clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"

Hi folks,
We established the newer mailing list <llvm@lists.linux.dev> a few
years ago with archives available at https://lore.kernel.org/llvm/.

This is in preference to our previous mailing list
<clang-built-linux@googlegroups.com> with archives available at
https://groups.google.com/g/clang-built-linux.

These can both be found on our homepage
<https://clangbuiltlinux.github.io/>.  While it was our intent to
deprecate the old list (and still is), we have not yet taken any
action to actually block new posts on the old one.

RFC but my plan is to change the following settings on the old google group:
1. Who can post: anyone on the web -> group owners
2. Who can contact group owners: anyone on the web -> group members
3. Message moderation: no moderation -> moderate all
4. New member restrictions: no restrictions -> new members cannot post
5. Rejected message notification: off -> on
6. Include default rejected message response: unchecked -> checked
with link to new ML as message

Then update our homepage to note that the archive for the old ML is
explicitly deprecated.

I think that will prevent further confusion, and sorry that I haven't
taken these steps sooner!

Thoughts?

Another outstanding issue is that it doesn't seem like there's
available tools for exporting the old google groups archive, AFAIK.  I
would love to be corrected though.

-- 
Thanks,
~Nick Desaulniers
