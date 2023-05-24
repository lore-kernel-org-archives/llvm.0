Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2378C8D0
	for <llvm@lists.linux.dev>; Wed, 24 May 2023 09:48:36 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3f611ccd08cso6069235e9.1
        for <llvm@lists.linux.dev>; Wed, 24 May 2023 02:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684921715; x=1687513715;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8l4VvjVr94dZvrHGrr+e0WzgjbnJVVHX2dBYB3myQU=;
        b=TI3rCsYo2SNzhf5zQfmZSRtYeNc8hUycL+Z4AvQVV8sW/Al2OnQLdnPrx/QxQlRSyJ
         /cgF15H0vt2fqgiB0apLuzvj1YjFtbQhdaFJGfQzrKotWJ0G897+K0O8zvDhF/9PNw81
         4+J1wgyQQJJL1A5hafGylJaGRkNjkxfEvUYC3uX+ixSPK4F6JGqZV/97nUd/v0lrn5m2
         5FGBqOiEGLxvO8K2QWxixuSdsmjo8FAYS97QvHlEpuniHFjtYLeHg2EsXUB988zpfkZ8
         OjYtzDOu89NghcIDpRFFdM4qS+iZEmlowN7Ei8I4Bb8G5aUWWa/PjTcBoEnUMLw7Nk7m
         hzHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684921715; x=1687513715;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8l4VvjVr94dZvrHGrr+e0WzgjbnJVVHX2dBYB3myQU=;
        b=Mtgv4oU7+t+Uba/780inU68SobIyW50VPYIUWsjsPk+nzh5t0KU/YB/qKVcqeJTGii
         8sBQ6zVz3VYtFdoSJ7hoJRlj9/RBZuqVRWfdYxzjcDwLaBkic5sAQqbKw+rXOmBv3exL
         I7tr5ZZ/zbDtpATBkAp4cyd95hE6iG1LCbaQvT60bSGqlJVR1wdPF6lI1G2rWJ5tEqZq
         cj0ibatPaPOnYQhWyrrIJBFpNcXFU1vPR2gipygNfs+owBt67ZkqykhbjIfX939nxPD7
         84wI5Vf2UPkvjgHfVRBIMWUezOSM1VjJdes90cozKi/1oIVZ75wj8Vt0cJ23+5u177AM
         cUJA==
X-Gm-Message-State: AC+VfDxyr7nrRhbFtHIOdB1fGSbHLswJ4MwJC2xPfXTglwCMhSQ3aZUA
	vgLGfuv+eXGQVUMeYEj/9xU8CA==
X-Google-Smtp-Source: ACHHUZ4XMDdStQgKrff85NZEZKRFlVA8V9QFMCe0slXyyQJwfdTbHSQ4YIcgmdFK84dT03iLAg2KDA==
X-Received: by 2002:a05:600c:2942:b0:3f4:2158:28a0 with SMTP id n2-20020a05600c294200b003f4215828a0mr12600097wmd.12.1684921714948;
        Wed, 24 May 2023 02:48:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id a2-20020a5d53c2000000b002ffbf2213d4sm14031808wrw.75.2023.05.24.02.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 02:48:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>, 
 Artur Weber <aweber.kernel@gmail.com>
Cc: thierry.reding@gmail.com, Nikita Travkin <nikita@trvn.ru>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Nick Desaulniers <ndesaulniers@google.com>, 
 Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 "kernelci . org bot" <bot@kernelci.org>
In-Reply-To: <20230524084324.11840-1-aweber.kernel@gmail.com>
References: <20230524084324.11840-1-aweber.kernel@gmail.com>
Subject: Re: [PATCH v2] drm/panel: samsung-s6d7aa0: use pointer for
 drm_mode in panel desc struct
Message-Id: <168492171413.2467334.7480313657663164313.b4-ty@linaro.org>
Date: Wed, 24 May 2023 11:48:34 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2

Hi,

On Wed, 24 May 2023 10:43:24 +0200, Artur Weber wrote:
> Fixes compilation issues with older GCC versions and Clang after
> changes introduced in commit 6810bb390282 ("drm/panel: Add Samsung
> S6D7AA0 panel controller driver"). Tested with GCC 13.1.1, GCC 6.4.0
> and Clang 16.0.3.
> 
> Fixes the following errors with Clang:
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/panel: samsung-s6d7aa0: use pointer for drm_mode in panel desc struct
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=6a038f0183dd5d3e289f6c1fe6962de9b31f8fd2

-- 
Neil

