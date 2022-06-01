Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09E87E
	for <llvm@lists.linux.dev>; Wed,  1 Jun 2022 18:00:42 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id s24so3379091wrb.10
        for <llvm@lists.linux.dev>; Wed, 01 Jun 2022 11:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=CoU8GVZ5QzWnprLeTKVABcCEkI0ltZArlMqYKwDo3Jk=;
        b=eiGrPPMO/FkatlkjR2iOWoIe0VCkBmffsNhWiePJUaROY4DpBokMA1QM8e3CbKZDOI
         p98M92aROj5kXxOugBb/2hyur2hIhpter+GHtvfFSdYwwOenmpLDsznSzfQhBsblstii
         UYUTjWU2a1K7MlqtaZUvn9sdMECwHXrmXR3E6WyLLKNDvmseRSW5y+3cFdYgLrUOjQrC
         GevQ3WXd6YbGgmB/fYpquaIpn/hhf7BQ4+UWXLgn0AdmMxcWSBNv8/A3mBdbI3TeFWVD
         T6CSZjEtqcq+sc+3G491IASex6sLNTcofM0m2MQiA3rkK7KDr7Ayi/TT/jZvmTVmakvM
         t4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=CoU8GVZ5QzWnprLeTKVABcCEkI0ltZArlMqYKwDo3Jk=;
        b=hTLjWvsON8yTXJ0ACJJZz9WdezCuY2/iqe72wF1wFcT3xVKvqMxHeViuy5H+eQ9c8A
         yFYv1Q+yJdRLXIPXjUWUTX2Wd0IvE7BO64A1c7GmMO+IwGWw5r5Lqii+PbRO7Vg2V9ot
         M8GQsolReKqQFDryCVZh5I9T7GC/3P5ZO9JXDo8iQKIlzYszlO27qejjDEWoJsA05nPV
         O1/AeBVv+8u/T4uxfWuN2lb9UtJdD1sF5ylB70RdbmEDqJ9qsdj+891Himw6kl0i4jYM
         3Xn42UvAjScUEN77o4EtKU3fK1GwcSfADWXnZw3NMV/LRTOaLWHSA+cdVTy4wgziz7J6
         ZL9g==
X-Gm-Message-State: AOAM530tNF3AbEChR6zpMcvJJoJ48Ak3tQ78sah5JFAF7tNSUtP5WDvf
	4j8Wgp13OO25vFwu5INZHGM=
X-Google-Smtp-Source: ABdhPJzBsvEb5f2h37s48HV3fj6wUsJ0ac7NlXfHiaHg103/YAhIvUdHAYW2wVLlFLLz/9dmYaUl0Q==
X-Received: by 2002:a5d:5181:0:b0:20f:fc49:6b88 with SMTP id k1-20020a5d5181000000b0020ffc496b88mr512525wrv.596.1654106441043;
        Wed, 01 Jun 2022 11:00:41 -0700 (PDT)
Received: from elementary ([94.73.36.128])
        by smtp.gmail.com with ESMTPSA id t17-20020adfeb91000000b0021031c894d3sm2480739wrn.94.2022.06.01.11.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 11:00:40 -0700 (PDT)
Date: Wed, 1 Jun 2022 20:00:37 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, linux-doc@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Nikolai Kondrashov <spbnick@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	llvm@lists.linux.dev, stable@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: uclogic: properly format kernel-doc comment for
 hid_dbg() wrappers
Message-ID: <20220601180037.GA26165@elementary>
References: <20220531092817.13894-1-bagasdotme@gmail.com>
 <3995c3d8-395a-bd39-eebc-370bd1fca09c@infradead.org>
 <YpcU7qeOtShFx8xR@debian.me>
 <053f756b-fafa-e07a-4308-0a5de8dda595@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <053f756b-fafa-e07a-4308-0a5de8dda595@infradead.org>

> On 6/1/22 00:27, Bagas Sanjaya wrote:
> Running kernel-doc script on drivers/hid/hid-uclogic-params.c, it found
> 6 warnings for hid_dbg() wrapper functions below:
> [...]

Hi Bagas,

Thanks a lot for fixing these warnings. I compiled it and I can
confirm that the sparse warning is also fixed.

Tested-by: José Expósito <jose.exposito89@gmail.com>
