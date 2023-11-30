Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3755DF27
	for <llvm@lists.linux.dev>; Thu, 30 Nov 2023 21:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Nlws4p27"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6cdcef8b400so1464842b3a.1
        for <llvm@lists.linux.dev>; Thu, 30 Nov 2023 13:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701381584; x=1701986384; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+MjKIfeA6c7V+SkVK7ESwNu4zKp4IlbbMa3hRtTv3E=;
        b=Nlws4p27lvMGRbHlBQWesXhCaIf5ZV6dTDQo8W82ngDRY4FMBIHyPV/v5Eff0MjHqG
         gmgnx2CxHJBNcDKzoub1XrPDor+KaMFNMw9nS43RnahiXpQspbVV523Lbb06AiUQ2Zfd
         a2qBvIAMXw4+kcw8ad7s0Ip7KLZJhphuSar0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701381584; x=1701986384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+MjKIfeA6c7V+SkVK7ESwNu4zKp4IlbbMa3hRtTv3E=;
        b=dDZS4nXL8EwWplkiOSUAGHpamwSSZL34nBUYFixjqJiseNhtmzqpoynZ7UDg3o25h/
         j27V/La0sPXZocp/4gRP6CiP0O5Jf9Wzep3GvYS2347OBE65P64I/HANppSdber29G/r
         Wu82UT/FKCmuAd1TMaV+imVU+3DSeKJ6748QBdkTzZfOWbqZEpEs1dIRPjyzd6kYw7qP
         Zu2Y5kaZ/fleKlze5ouUH6+QD8ItN21cCIH5yPqOVRDkKHIRA9Buc3iXhQeJep2fBt3G
         cet2nogl88QGC3FOj46ZnFQhx+ppk3i/WgSbtiFHcDNznOKo6tO0uj4aKm299CyyAfLG
         HC7Q==
X-Gm-Message-State: AOJu0YwsUxNpEPkUYo/aunC0a6QhSh2eVndndC0S6ev4IeMnEe+t8Nba
	Umrw61uFTPk24bA9BHlZ0UacZw==
X-Google-Smtp-Source: AGHT+IHnOCwCjzZBfKxzRTjC4fQ8XP/8fQObomS+nCckrMFuuQt1ZNZTYjBCrPSpglsbSfTmpIMqEQ==
X-Received: by 2002:a05:6a00:2d95:b0:6cd:dece:b73d with SMTP id fb21-20020a056a002d9500b006cddeceb73dmr6204554pfb.18.1701381584754;
        Thu, 30 Nov 2023 13:59:44 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id k5-20020aa79d05000000b006cbcd08ed56sm1683994pfp.56.2023.11.30.13.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 13:59:44 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Kees Cook <keescook@chromium.org>
Cc: Shiraz Saleem <shiraz.saleem@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Gurucharan G <gurucharanx.g@intel.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] i40e: Annotate struct i40e_qvlist_info with __counted_by
Date: Thu, 30 Nov 2023 13:59:37 -0800
Message-Id: <170138157431.3648624.12161951188288893323.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003231838.work.510-kees@kernel.org>
References: <20231003231838.work.510-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 03 Oct 2023 16:18:38 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct i40e_qvlist_info.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] i40e: Annotate struct i40e_qvlist_info with __counted_by
      https://git.kernel.org/kees/c/da2e08d4630a

Take care,

-- 
Kees Cook

