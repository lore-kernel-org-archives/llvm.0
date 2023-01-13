Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475C6BA57
	for <llvm@lists.linux.dev>; Fri, 13 Jan 2023 23:15:23 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso28495315pjt.0
        for <llvm@lists.linux.dev>; Fri, 13 Jan 2023 15:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMiMCJTb5LFuwR4bml+l69hnYQL1G+akTSIgXjV1vXs=;
        b=X4KHjEhczDirMTjK/fziTxAevbXGGw7rq9kx81W2fTPIvGLoGCfwSt2nBrHlVe2W8G
         Q76Va6blny+IfEe2b39IPgaNPxMmK+0Vr4hzPMoiCnrLxsyIWeVp8LDSNcUPDE4xrgVR
         u4JyKKHzeF1QdYduZFXFEBBzXpOAzhL+bnVzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMiMCJTb5LFuwR4bml+l69hnYQL1G+akTSIgXjV1vXs=;
        b=6opB91Hg0B2hUtRlB7d2MBHeGf5x3U0WUba+LbL83cbPdaymffqL/iGZF153xrX17x
         ajlhGraJf//DJ7lvBAjVmxba7IzmWKK/HZhjkSDU/p1csRKiXQnJnDVdv5wEgmmxPBpV
         SIIqSHB7J7xhnRK3FsMOa1jgbrutTG/PnH7w16l7xdcZLt9OndTV4g1s3yNI1NwCn+dL
         u/9rmpRUhCTPqY3tisx98/DdycBTlZCmN0lTKU5uI0VqKYZgtSC84q/fQ3sj0NfDGf/7
         k1mbTeaOiYl74dcdMQNszhCyj/wbSqawqRc4DHvb13mkSpRerJGW3Hgz8/jgJqO2i++R
         XFIA==
X-Gm-Message-State: AFqh2kqYpgpQ3ptox2s+qrVVnLeDQcZ3kOMVEMhQD/cd2Gv9n6VzBiWq
	islw4C0PnXVhObWzeT0QJg2vTw==
X-Google-Smtp-Source: AMrXdXsWranqUsDdC6q52vgB5+sRwTueXpbwliTJq7AwCJ5IYX1byQz9BWxPmZN5AsX25qyHE/XO8g==
X-Received: by 2002:a17:90b:3d8e:b0:228:f3fd:a0e2 with SMTP id pq14-20020a17090b3d8e00b00228f3fda0e2mr9863452pjb.13.1673651722785;
        Fri, 13 Jan 2023 15:15:22 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h7-20020a17090a9c0700b00219cf5c3829sm12902587pjp.57.2023.01.13.15.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 15:15:22 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: masahiroy@kernel.org,
	peterz@infradead.org,
	samitolvanen@google.com
Cc: Kees Cook <keescook@chromium.org>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Subject: Re: [PATCH 0/1] Fix CFI hash randomization with KASAN
Date: Fri, 13 Jan 2023 15:15:18 -0800
Message-Id: <167365171646.590452.12835527795605016769.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112224948.1479453-1-samitolvanen@google.com>
References: <20230112224948.1479453-1-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 12 Jan 2023 22:49:47 +0000, Sami Tolvanen wrote:
> Peter, Masahiro,
> 
> I noticed that KASAN+CFI fails to boot on x86_64 without
> cfi=norand. The randomization code is missing a couple of KASAN
> constructors in object files that are not part of vmlinux.o. This
> happens because we don't run objtool for the files, which means
> the type hashes are not included in the .cfi_sites section.
> 
> [...]

Applied to for-linus/hardening, thanks!

[1/1] kbuild: Fix CFI hash randomization with KASAN
      https://git.kernel.org/kees/c/a6c5a3491b3f

-- 
Kees Cook

