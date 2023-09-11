Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F89AD2E
	for <llvm@lists.linux.dev>; Mon, 11 Sep 2023 18:17:46 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-501bd6f7d11so7778619e87.1
        for <llvm@lists.linux.dev>; Mon, 11 Sep 2023 11:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694456265; x=1695061065; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5gPChrpnRFIH9nIPBCxBWuu23aFmL6bH9FcwiVvWj+o=;
        b=k2ClzInG7iskY7ue6mdAiwT8FyIpURQPzOtKMe3cYlcMOHGowvP6+cqdy304Nc6hSS
         t+vUJv8Nobp5I3ZzWNzwHeGqg5Rx+sRYsPtXJfGja21b3zpLSWPt0f6Jy2P1IIykTsSd
         fexxQfzzOrLizM+yBeeeLCgqDbtZbPptHkGfp/BULnKE0FpN6+xMyzmXl4C9xQiJZ+2/
         rokSmWcMAUJtCmhgldLuG+uEJcXlu/soCdkAzq1j35yZX553QyHN9hqTjJfdl06XhiIj
         /hhSWcPn/tKFu2kHtdy9Uy4yc8phc7nLs/1wRrbd7cFBNr+S0ddCEHYDoGUnxD3bZXPW
         3UbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694456265; x=1695061065;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5gPChrpnRFIH9nIPBCxBWuu23aFmL6bH9FcwiVvWj+o=;
        b=JFCB9Dz9o7QIdz1Ya3/BiDoTl3hOViJnb9lQKnuYjLuFSN3ADKVHrXUtxROUDCOXoD
         geDcKObQvsN/botYPoL9RD9e3/BQ4LbDkWnsHsJ4UgdWvyLse8Zvy9geayDGl+Ml8sNJ
         3gePSck3xGdD1tjx4ghmnllgSfnK/HqoHq98G1OxncLDMsX1ZwieL2RdY9TvSWDtLPsT
         mokYDh7K1bliLNm+uJbjJoI3Y6As8NnHeioUzfqewZOx/y0th8cRNG8Md0XAU4qqsPl0
         88qQCdcwpqOpXnkmxE52H7fW9Fec6i1z/t0pEadFIg9nocVXjzdbvYL8RNfO2dC6Ksaz
         aC2A==
X-Gm-Message-State: AOJu0Yy/G8juIXel5pj32wvQMx8F5KJKQUhMOe4NMBOcN7TZhmfFHDOn
	GRVlqI3YZdMGvW78yhRJ5hqDMZxqemdjAtcmIQM=
X-Google-Smtp-Source: AGHT+IGeuD8PkC6LZnVbg3DFRf/dhW6GNRL0CVAN42hta6U5v9PddaAcBPuFi0qHuY+oewo2ylylLiaYtBpTiQm0qzg=
X-Received: by 2002:a19:8c0b:0:b0:4f1:4cdc:ec03 with SMTP id
 o11-20020a198c0b000000b004f14cdcec03mr7464655lfd.18.1694456264593; Mon, 11
 Sep 2023 11:17:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdnaEakT_y8TA9b_nMY3kMp=xxqKpGQPc2drNqRdV39RQw@mail.gmail.com>
 <ZPozfCEF9SV2ADQ5@krava> <ZPsJ4AAqNMchvms/@krava> <CAKwvOd==X0exrhmsqX1j1WFX77xe8W7xPbfiCY+Rt6abgmkMCQ@mail.gmail.com>
 <ZPuA5+HmbcdBLbIq@krava> <CA+FbhJNz4i4pU+8nT7JBvQKSa0VCkzcNzaJ=dRdRn+JCSTdgKQ@mail.gmail.com>
In-Reply-To: <CA+FbhJNz4i4pU+8nT7JBvQKSa0VCkzcNzaJ=dRdRn+JCSTdgKQ@mail.gmail.com>
From: Marcus Seyfarth <m.seyfarth@gmail.com>
Date: Mon, 11 Sep 2023 20:17:33 +0200
Message-ID: <CA+FbhJNbnWORbz0CGQ_9eAOTMqidw4p7rXrdcsGygq2kE8WzxA@mail.gmail.com>
Subject: Re: duplicate BTF_IDs leading to symbol redefinition errors?
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	bpf <bpf@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Stanislav Fomichev <sdf@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"

I hope this one will get through the list as I am not subscribed yet
to the LKML.

From Fr., 8. Sept. 2023 um 23:22 Uhr:
> I've tested the patch from Jiri with a fresh snapshot of clang 18.0.0 (254847fb149fdc03ef601badf69ee08150345a5c) on my custom 6.4.15 Kernel with FullLTO and it also solves the reported issue (the Kernel also boots successfully).
>
> Reported-by: Marcus Seyfarth <m.seyfarth@gmail.com>
> Tested-by: Marcus Seyfarth <m.seyfarth@gmail.com>
