Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816271FAE
	for <llvm@lists.linux.dev>; Fri, 28 Oct 2022 21:23:43 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id f9so5898288pgj.2
        for <llvm@lists.linux.dev>; Fri, 28 Oct 2022 14:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cs57GpHqiEaUWAQS4x0FdYfIt3gye0GQitfWQ5q7LSI=;
        b=kcZLpIXF7fyFZVyjeIoJRf1KW7qkt5IfCDmxI6FIpKrDmPUchUvFwLlOQ5zCb6wkf2
         yo2eUg6r6UTVSNgetW1t80iijaQWwZ59vCQwutKCCj2wsdZ/ZfGQ5pHbP5Lfr524w9Au
         2xBw0PYyWpCQbgAJWajlZzP+l054n1GdzsBbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cs57GpHqiEaUWAQS4x0FdYfIt3gye0GQitfWQ5q7LSI=;
        b=4MJZ/FyrIGl0F/eWr0RmNK8EMmqC4NKBpycYUwZrylh9ccw7O0F4O1DUJ+72VEekos
         f+7cTa6C4xehAQcBsmCqqxAJKKiq4mP1SFT4/w40ymouQVAAriL7zERu93n/NxBvpsUh
         mglTCQyOCbIGOXOgZ/mJFZ2Drrfal1KxL9NrTqnkQ6OvHj5TGUVCDKTTQomOHh462azD
         rd9dbkhmPs7JddzGKrlNRHfpUIz8SdthabQH+Gr4rmPCH2Xjsdc0yIdYT+MO/K2jiKb3
         Q8zIYBe1sLnyTeVXSLK165JPFx6LZ/PFJYbMiBZLTrP5ET8y9VTI1Wg+8IpguWoac6g0
         h0Mw==
X-Gm-Message-State: ACrzQf3M+CQCRZOHOYbO9plIwIDQrxG8mLZVePnT3MUxaS5faCzGB2FL
	07oNZ8ApjeL5SMGc+/BuohiU8RA/Rt6cnw==
X-Google-Smtp-Source: AMsMyM7UcvF2uCV+FwyTaTQtIG+fYtOv+V6Yk6R7YMfAgfg20rw4FNUE8cNCGefsLDsT5MXxeCbQBg==
X-Received: by 2002:a63:ea4c:0:b0:46b:2772:40a4 with SMTP id l12-20020a63ea4c000000b0046b277240a4mr1301049pgk.342.1666992222956;
        Fri, 28 Oct 2022 14:23:42 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n4-20020a170902e54400b001867fdec154sm3505586plf.224.2022.10.28.14.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 14:23:42 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-kbuild@vger.kernel.org,
	xin3.li@intel.com,
	llvm@lists.linux.dev
Cc: Kees Cook <keescook@chromium.org>,
	nathan@kernel.org,
	hpa@zytor.com,
	peterz@infradead.org,
	andrew.cooper3@citrix.com
Subject: Re: [PATCH v2 0/1] kbuild: upgrade the orphan section warning to an error if CONFIG_WERROR is set
Date: Fri, 28 Oct 2022 14:23:21 -0700
Message-Id: <166699219839.2165587.10773311882818616441.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221025073023.16137-1-xin3.li@intel.com>
References: <20221025073023.16137-1-xin3.li@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 25 Oct 2022 00:30:22 -0700, Xin Li wrote:
> Andrew Cooper suggested upgrading the orphan section warning to a hard link
> error. However Nathan Chancellor said outright turning the warning into an
> error with no escape hatch might be too aggressive, as we have had these
> warnings triggered by new compiler generated sections, and suggested turning
> orphan sections into an error only if CONFIG_WERROR is set. Kees Cook echoed
> and emphasized that the mandate from Linus is that we should avoid breaking
> builds. It wrecks bisection, it causes problems across compiler versions, etc.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] kbuild: upgrade the orphan section warning to an error if CONFIG_WERROR is set
      https://git.kernel.org/kees/c/450301ceb4e6

-- 
Kees Cook

