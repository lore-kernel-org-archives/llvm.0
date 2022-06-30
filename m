Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0E03D83
	for <llvm@lists.linux.dev>; Thu, 30 Jun 2022 18:46:22 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id z13so35204909lfj.13
        for <llvm@lists.linux.dev>; Thu, 30 Jun 2022 11:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=vIzLXlrqi0BRAmiWe3RX0HjlFWXqa2cLufMgMBs+YGE=;
        b=Glhcpf/Zl6vRHcA0KVhKQe/uUE4/8TXRGPrgaThJqxxAHok2zyTSU6DJJhD+p0vLl5
         1+DBMi5me7Yi3J3RUwpsKcyIm1W7pZHHyLoipKrLYqCzbbUTu4llVECqdbEFIQgHN9Ke
         qKR25Q375DqZEXrB8zFTF4OHaeBir3NdptlPnK8DYgSLKgOIgigrqArh245WQ2GF9Vdh
         rH6ZCy18STQBC12T4PSYm0om4IZ6qSyRLlslUBqWNtQnEfJsE+gSbRP1jPfBsBzzWeca
         rHJ57RhBYJg1LqQbPK+hZcsni7yYPLj1JXw30QzWQgB4J69ZvLRK29h1V/aWD6boPg+S
         Tb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=vIzLXlrqi0BRAmiWe3RX0HjlFWXqa2cLufMgMBs+YGE=;
        b=wVPrKsKmpUXy5FxS1jL9XGmYbf07E/Avp0gZm3rtK9fvGKt49ifRMB0kvoZ+Omi2T1
         jK9MlyJ54OpQ/jEjSe67OUkvhPOvjydXwJ7QCIgEWJ8XlGmEodSQbnABz8LR+Spm1KGb
         TJgxN9KdVkBdW4ODBr9+LGv6fKaV6PiABiBr9p/2kDiviS92fOWTGoEeZ5s9hdOOV3iG
         Z9wXPZdeXGUJqHacN0esUn+lJMsvBL/txgalVtPgYo8CLuJ95Osih5lmw1HOquLXpfe5
         /H9sHpHYWhJ6HgN58DB95/fZKQgCxqAUvIjXIVG/zfsnLCcxSSrk72hfP+r3/nszH74T
         1KOA==
X-Gm-Message-State: AJIora8FaP3kAOXLdTwT3z7J8HdSh9mxDPnHHi934VY1j1DHO8z8GjtJ
	nFqu9S3bfrCNSkVh01jiTCrHTBEx8NY4XzEXnmR6Xk+iOLI9PA==
X-Google-Smtp-Source: AGRyM1u7OlcxkLnxNQfzZdYm9LllGscLxp2X1a0PAH85+0uTB/DokyM3Wzrs4ssUrhLhHqTKGIAVpTPJ/E/yfUny3ys=
X-Received: by 2002:a05:6512:1307:b0:47f:baa4:52c5 with SMTP id
 x7-20020a056512130700b0047fbaa452c5mr6241305lfu.103.1656614779817; Thu, 30
 Jun 2022 11:46:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 30 Jun 2022 11:46:08 -0700
Message-ID: <CAKwvOdnouptmT+CSQWWKH_wr3vvggt-SXYWGiY0sEKpBKAQ43Q@mail.gmail.com>
Subject: shout out from Bero @ EuroLLVM '22
To: clang-built-linux <llvm@lists.linux.dev>
Cc: Bernhard Rosenkraenzer <bero@lindev.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Check out this shoutout from Bero @ EuroLLVM '22:
https://www.youtube.com/watch?v=3Dh9xg8Y8byIg&t=3D573s

> Next thing that used to be a problem in the past is building Linux kernel=
s [with clang]. That was quite tricky early on because VLAIS but that has a=
ll been fixed. There's an active project, [clang-built-linux], that makes i=
t better.  Even including the LLVM versions of binutils, even linking with =
LLD works _perfectly_ these days, so there's no reason anymore to build a s=
eparate kernel, compiler, or anything.

--=20
Thanks,
~Nick Desaulniers
