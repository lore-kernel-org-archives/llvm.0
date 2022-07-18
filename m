Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A98ECC
	for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 12:18:49 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id h14-20020a1ccc0e000000b0039eff745c53so7205433wmb.5
        for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 05:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=J5+lRET7tmqFyF3iigcZ6MC/zTg0z3IFgd8Q1k7sk14=;
        b=HWuJl5T1wREE5JhfHFh8FLXqjtzoKg58x5GyurdfrCkMke4NahBlhdTfn++zibJhmi
         vxQMYe7OVot7rc2rgpcoXISeObZuBeDK6hcivyphQ6Ro3LczrhRnvx2B9KGWgo0gIZtD
         3Oakki1iEGtLYMofWWG6eVK9M3OCkDQ9Ph33YNkeJRY5NMgFRcFV8n1NgS1iD6IuQC3U
         FviydQXwWFYFoHgDejdP54ZrCalXGv/j/1YJlixujIjN2ckIVSy8b1ocW2zu17uVve8E
         BWvqIV8z8GK0Key/sYyZ6knn4QdXldNNguAMwhGhWMk1UBmadWxq4R2UZZ8L91rmVWJu
         guYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=J5+lRET7tmqFyF3iigcZ6MC/zTg0z3IFgd8Q1k7sk14=;
        b=lz6eA00SnEfKtM437GSr/ktbrZ4WAnMQ630B2M0RM7jqpgKXpJwd/fdoj0ZGtuOklg
         4iAZ9HizVd0kmGzOQOz3Gl5vkzKtk1yj9wTREPWHZ9wxyUdU91M9ak0rMwLSjxE/knrM
         KdxaIpmy4Oqwk4QlsXws7BZjtxm9xTqOA/cfvToJaWKoCMqPquncm+DwJdIxmg7r5CoD
         poDMX/3upDr8GHxW5+T3OefI1gvMjjjWnqwKZzM/JZ7ZzQMmZv9UK6YCl2vPm0cj6aT7
         VSuOzqKe22DKJ7R1TuIMnUbt/ELKDingkgZoa1vIo0T4OxMdBCqFqAG9Mc++PwP+4TZS
         qR8Q==
X-Gm-Message-State: AJIora9EbhTnpT6dPU4HCcVwdajKB3wgvQ1nNHcOkiftNImKbYPsEd9g
	Nuwndkg9drMWxajBfgdVs/Y=
X-Google-Smtp-Source: AGRyM1t4Ce2antjZbHR1q4ags22JCSIitBkfzoicTy1dEkaZ+rnOwyzRNJy2SlyiRTfJO6Z8TSMt5Q==
X-Received: by 2002:a1c:f607:0:b0:3a0:3dc9:c4db with SMTP id w7-20020a1cf607000000b003a03dc9c4dbmr32559273wmc.30.1658146727489;
        Mon, 18 Jul 2022 05:18:47 -0700 (PDT)
Received: from debian ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id k15-20020a7bc30f000000b0039c54bb28f2sm14944938wmj.36.2022.07.18.05.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 05:18:47 -0700 (PDT)
Date: Mon, 18 Jul 2022 13:18:45 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev
Subject: x86_64 build failure of next-20220715 and next-20220718 with clang
Message-ID: <YtVPpVFwy7WhXKPx@debian>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi All,

Not sure if its reported, builds of x86_64 allmodconfig of next-20220715
and next-20220718 with clang are showing lots of new warnings like:

warning: objtool: asan.module_dtor+0x15: 'naked' return found in RETHUNK build


--
Regards
Sudip
