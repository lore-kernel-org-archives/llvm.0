Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D739833CC
	for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 17:37:19 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id e15so16334122edj.2
        for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 10:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b+gmIONhiXxkz2QJGmvVZScE/IgGuCeLYBs+pSoO9pY=;
        b=oElG1zSg7nkfYFa72t3wUeZgcCxRnPTZd06p685jd9catlbeoNHx5ZKn2aRERXYU/z
         rSTa7xtQMPkuJwPkww0ddidvQY2YkPeaW7K1FYhUnOh5KHMoanza38wqZyGD7wNo9l0c
         Q3SI8OUBXlVKxqWQpenJ7n7MZFRBgk4ItwtGBq6sHr2SHZcGRncahiJKiE9y65fkDD7Y
         g3r7MQBhyiwHwYfoGqQewG8Y74bedQdDAPPNgJGx2035cQih2V8W/7eXAz+c7gqHkdbr
         NgUPksjmmgnvD6rKpGn7kbuh7PqpjgJ17POw6UvHu9mGhU4Cky+yF1yCAqxeQhBpYWkF
         +s0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b+gmIONhiXxkz2QJGmvVZScE/IgGuCeLYBs+pSoO9pY=;
        b=bvzVj+uGDULiNyer6C5I2Q8d3EdPfbwCMV9Mw6QGOVSWDCIK3/dfspusnl1MnWcTgV
         FJ+N8yWd1PdZsgeDBGcblfm/myXQwrYs/jPUwkMCaaecFTiywj5mMroEAHPNjnwiuwuG
         mKlPISDOZYn0bTLCMlKDvsxReZQfTqMh0GMfNGm/SRu16hQbUPu8xOldyu9arYqx9oMw
         cP1POI22ceyIGDN/NVmb8VcJlEmq9Ca8w+D8MvEjdZwI+9IKKrrqmtniYuOrtlrh1VqQ
         7BGyMiwFa8ynDXibHkudmCmHq2aPF3LuP2S9yfbG+Z+/e00w7TM0zmYzOrmbp71PNlL/
         nZQg==
X-Gm-Message-State: AJIora9rm9/T5ii0S+dXQFbuA6N3YLlv4MLehU6ulZfGuh+STTqS7/Xk
	SiaachLK5ZQQE4k3IR3XKijH3l1shWYEduXQI/GYEg==
X-Google-Smtp-Source: AGRyM1vbZFm8g67CerRlz65r1qAynjhwjir/KKeN6fTAWvWageMn3GxLPmiyd9V+vMFp0XRoBaNcqXCzlRC+GI41ufk=
X-Received: by 2002:a05:6402:3511:b0:43a:cb79:e7cb with SMTP id
 b17-20020a056402351100b0043acb79e7cbmr37681105edd.43.1658165838087; Mon, 18
 Jul 2022 10:37:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220711222919.2043613-1-justinstitt@google.com>
In-Reply-To: <20220711222919.2043613-1-justinstitt@google.com>
From: Justin Stitt <justinstitt@google.com>
Date: Mon, 18 Jul 2022 10:37:05 -0700
Message-ID: <CAFhGd8qRfhQg2k8E7pUm5EYSLp+vmtSd5tZuqtpZUyKud6_Zag@mail.gmail.com>
Subject: Re: [PATCH] iwlwifi: mvm: fix clang -Wformat warnings
To: Gregory Greenman <gregory.greenman@intel.com>, Kalle Valo <kvalo@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Luca Coelho <luciano.coelho@intel.com>, 
	Johannes Berg <johannes.berg@intel.com>, Avraham Stern <avraham.stern@intel.com>, 
	Miri Korenblit <miriam.rachel.korenblit@intel.com>, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Any chance a maintainer could take a look at this patch? I am trying
to get it through this cycle and we are so close to enabling the
-Wformat option for Clang. There's only a handful of patches remaining
until the patch enabling this warning can be sent!
