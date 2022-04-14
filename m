Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE063225
	for <llvm@lists.linux.dev>; Thu, 14 Apr 2022 21:28:22 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id t25so11246137lfg.7
        for <llvm@lists.linux.dev>; Thu, 14 Apr 2022 14:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=FQiaDvmcGWvBYzNP/sv5XVpDNfZwbnu3qaY+4ovDXMc=;
        b=C7aHsnt1H2h49DEHHYgqBMFF+WGxqu+705H2dVftIWwgXuiCL3hJ7NH1e0K+vHvMxt
         aNSH/xiPvQKQMKMe/8cRQVV6NBoV8vPqH6P8rUw+Vs6q4Ny+hEbMG2v2nzuB+GgJrD/G
         hlCWritHYdEbbg/OEoSlbuSU337KxUTi8oQgXhMWcWSpeeTOxr5vnzBY6xGjWqXdVhLk
         SAOGk883kmirAiOwMji7NKSNvuNbKMOtMJnkowcOrtmhNxZOFe1AKowHsOMitydyniKA
         MqRQl2sUW2zst6zGH9aUeNKOynXpXVaNpsG2WdZDhorBkmQN3927HE9ZzUBzk8zxK07I
         Pqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=FQiaDvmcGWvBYzNP/sv5XVpDNfZwbnu3qaY+4ovDXMc=;
        b=dDbmwM9qnbxw+NSrw4R9esAtWWR8iu4fcIHyL8e6zFN1xag71kkQ3K1TkmsndAbLei
         tgY6YYTuwbEqkbFW7G1tnfrxNK5G+nHxF6c5yyjdqYoV9Z8Mo5k5qhJz6MxG1DY39WiB
         dqG8zlLqf3ouVsAqr73kA/Xlizjwn6SF5QYRs36fbpM6WiP7+eBV8Ci9pigS0A/T/6wm
         OZuD3t8NC2Wx2jkOlrHyf6qoALePLD4ojb6DHbcmQovvDXtCJRQXeiGnHwoouVRz31/G
         kYBUuVLIRcR8zFncMVKBfpHkqEthC/MOzYgzAeDwS82C+RyhfUe4EtJFpvoA/pdvkFPv
         zpWA==
X-Gm-Message-State: AOAM532NZUWN+W7xOgAFlV0DNehu/qlntqG6j2qQJWNeujChbB4RwlIX
	/VXQv3gA67p8Eta2PCfiKWM2gx/9DrN298Zyq1BDqg==
X-Google-Smtp-Source: ABdhPJyo/O8Nf/66ydSQVcloRuCUj1c7JI9uSISejiO9S/fIcqjiMS7lTKzxtLRuKsSF2dnMt3+mEIXx3q/QJjaKGqY=
X-Received: by 2002:ac2:4e66:0:b0:46b:c3d3:e203 with SMTP id
 y6-20020ac24e66000000b0046bc3d3e203mr3188846lfs.380.1649971700332; Thu, 14
 Apr 2022 14:28:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 14 Apr 2022 14:28:08 -0700
Message-ID: <CAKwvOdkyMyE0ZRUU9Rh4qTxpOseD=fydo-FB9kdd7zRo7nVreg@mail.gmail.com>
Subject: plumbers talk on kCFI, BTI, & IBT?
To: Sami Tolvanen <samitolvanen@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	"Moreira, Joao" <joao.moreira@intel.com>, Mark Brown <broonie@kernel.org>
Cc: "Jose E. Marchesi" <jemarch@gnu.org>, clang-built-linux <llvm@lists.linux.dev>, 
	LKML <linux-kernel@vger.kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Hi Sami, Peter, Joao, and Mark,
Jose and I are currently in the planning process to put together a
Kernel+Toolchain microconference track at Linux Plumbers Conference
this year (Sept 12-14) in Dublin, Ireland.  Would you all be
interested in a session on Control Flow Integrity in the kernel?
Mitigations in hardware, software, or both might be of interest to
discuss more in person?
-- 
Thanks,
~Nick Desaulniers
