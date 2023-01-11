Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061ED23CC
	for <llvm@lists.linux.dev>; Wed, 11 Jan 2023 12:11:36 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-4d59d518505so23145047b3.1
        for <llvm@lists.linux.dev>; Wed, 11 Jan 2023 04:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RUzF6lCgQp1o/2q+i0d8WNfiUX6YauMmBM07mYYsz+8=;
        b=C9cnI762pLG141ok2YPMk9grobHR2SRWbOx6Cu8AkaVyWSSPXRneG2gXkqPWXbHRDY
         ZjnpMVG8VuglbhbX20cfLILPt9bbbn65qpN4r2YTDIjy7JmB9vhIf4ds1kHPWxFr7E/B
         E1mMIpd4+O55RON360qn0NnY7NVmRMf4SQR4avMQFfRdMwW7GSCPIWGHzGOVpW7MTwFV
         qAUOQ/GIhnyX6ZGTbW0Jxs1rNxmdwdJu0ZJ1qntBvmO6l5Ibu4aeWsiYcY9qAT3uiTCO
         sHk46ShDefZxf5QT+QRZZ1xFFh73nHX1qL7o0jgScpC/jZu+VGEma2QR91dZ1cfW0F9a
         LxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUzF6lCgQp1o/2q+i0d8WNfiUX6YauMmBM07mYYsz+8=;
        b=XI31VFAyWNa/D2MsAvTk81X2P07Zl6dK3DiCPMulU1Zx4uDVzZEPPmEkWBPgFY3aYw
         X6JFAl0Jw2DwdCH7/QiAYvMiis3kcl2O9vcMlOoSmMhP3PENVC/iFUKsPF9DtXf9OO8M
         tH+sARrgfV9fWLvVNHNpqBqIDk68sz1cyTx7aZ/Igiiu7lyJnFd5ow/bIOKUrGR0aTuW
         J5RleFJYU3ysskf3IRI7vaRqF60guPfbYeFJrMWUzCCIslaBdsjS0lg5mSJ65IIsiPQn
         gxSoqEsVtY2Tbx9HOjDaxMxviKIVYsjFlLSqete+U2KgnZPR1WylrztO6P/qskD/G/X4
         1Yew==
X-Gm-Message-State: AFqh2kpcaLJfv95YcJYTvuYc2/YhQtAtYHPptdIKxE3EIZG++jWhOkgH
	0mxXHhLGqFNrjOEMyM5znQU5fJIYtZ9hOZU+3m+xhQ==
X-Google-Smtp-Source: AMrXdXsBezIy12jb9dB6vhG664r5MR15R3YnEJOWcAFL3Nbg9ez+Wq1tPt0DzTD5RWYTCpvs4/4SWgAVcIDBRYy2oZ8=
X-Received: by 2002:a81:a513:0:b0:4b5:55fb:6cbc with SMTP id
 u19-20020a81a513000000b004b555fb6cbcmr2804118ywg.10.1673439095845; Wed, 11
 Jan 2023 04:11:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202301020356.dFruA4I5-lkp@intel.com> <aa722a69-8493-b449-c80c-a7cc1cf8a1b6@suse.cz>
In-Reply-To: <aa722a69-8493-b449-c80c-a7cc1cf8a1b6@suse.cz>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 11 Jan 2023 13:10:59 +0100
Message-ID: <CAG_fn=XmHKvpev4Gxv=SFOf2Kz0AwiuudXPqPjVJJo2gN=yOcg@mail.gmail.com>
Subject: Re: mm/kmsan/instrumentation.c:41:26: warning: no previous prototype
 for function '__msan_metadata_ptr_for_load_n'
To: Vlastimil Babka <vbabka@suse.cz>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Christoph Lameter <cl@linux-foundation.org>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	kasan-dev <kasan-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 2, 2023 at 11:01 AM Vlastimil Babka <vbabka@suse.cz> wrote:
>
> +CC kmsan folks.
>
> I think it's another side-effect where CONFIG_SLUB_TINY excludes KASAN which
> in turn allows KMSAN to be enabled and uncover a pre-existing issue.

 Thanks for bringing this up, I'll fix this as Marco proposes.

Would it also make sense to exclude KMSAN with CONFIG_SLUB_TINY?
