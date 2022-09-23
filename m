Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF323C05
	for <llvm@lists.linux.dev>; Fri, 23 Sep 2022 11:49:40 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id n12so20032825wrx.9
        for <llvm@lists.linux.dev>; Fri, 23 Sep 2022 04:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date;
        bh=c7Tx9HKxUWh0xGhkeNMbuTm7Bc6XNgbJWQ+SJrtDyPc=;
        b=Xs+GlJ/gwSWKKlmvldlFRVntIBYxuC/LRSV1n0pYgLzLkUtitrnv1nnNThNBdNEmiC
         TJVAPoAQA29rD1HMsN4pB7ufm6O7K/7GzDwEoR5zQSo/5yX7OCod64nMONy/qkuO/Cwf
         wI4VRAU/pGyEcH+xvBvNTQsP8UX2uvPAI8Nm5n7KcgZvoHz0EyAF0tRG55eRjHkREShA
         1hTbCkIyde7X6NIYhaCm2uSt9kgTnp2c3k5oZZstGBYALUqI5wr/gBcmCGUcIMMu55Fa
         BRU2co7lqjj6WY88Ky2TeUY+J9lhvLRcjrgJLkAcdVLE8E5KTpO1EXOOymvuIGrpiUJB
         xcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=c7Tx9HKxUWh0xGhkeNMbuTm7Bc6XNgbJWQ+SJrtDyPc=;
        b=YzIz4Dif/giuciET3PWFjWVbctWH4OckySUQk9jrbun2ZoZNj2N5D61DKMiRAXF0d9
         m632Iik5mE5QcFe1JS1DjmI+1H53r9/We4ry0yUDTsIRcg8/PhXEecFBc9kpC/oKJ/xb
         j+lPnZ1ywT7iLDXJTPmPjyzti5jBzsgzlxVLXw5mfG2rce4NvUfoOhlz8H1hoSdO4RLI
         RM+nE1U+VVWu2KMrPuDqwM4pC+QSEr9V9UoNas5y/PUhl6MRMv4eF3xn3uX0nbngMkEE
         EBgTrYAuj4GfHfW/ZwO6Nxq8KH2kg4tHc2ZJBkA8jH7ifAK1BHSQVW655S+NMXweX7Xw
         87TQ==
X-Gm-Message-State: ACrzQf3cbo0XAM2TD9I0iHs944r8PafQ9tWD0Svc3KulGTOAUJLztNuf
	LVmRa0xQBhqehg9mUWn7MWs=
X-Google-Smtp-Source: AMsMyM6EBH2GR4oCpp4cub1DEuj58J47hRZrr5TBo+wPaCXGfmyrEJ0Mdp959I4dFUOt5Ug3zqLlwA==
X-Received: by 2002:a5d:6245:0:b0:225:3e24:e5b1 with SMTP id m5-20020a5d6245000000b002253e24e5b1mr5084277wrv.698.1663933778281;
        Fri, 23 Sep 2022 04:49:38 -0700 (PDT)
Received: from debian (host-78-150-37-98.as13285.net. [78.150.37.98])
        by smtp.gmail.com with ESMTPSA id bt24-20020a056000081800b0022a9246c853sm7623449wrb.41.2022.09.23.04.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 04:49:37 -0700 (PDT)
Date: Fri, 23 Sep 2022 12:49:35 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	llvm@lists.linux.dev
Subject: build failure of next-20220923 due to f6f6f9a01374
 ("thermal/intel/int340x: Replace parameter to simplify")
Message-ID: <Yy2dT5bKGc4aOJIl@debian>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi All,

The builds of x86_64 allmodconfig with clang failed to build next-20220923
with the error:

drivers/thermal/intel/int340x_thermal/int340x_thermal_zone.c:222:6: error: variable 'ret' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
        if (!int34x_thermal_zone->ops)
            ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/thermal/intel/int340x_thermal/int340x_thermal_zone.c:279:17: note: uninitialized use occurs here
        return ERR_PTR(ret);
                       ^~~
drivers/thermal/intel/int340x_thermal/int340x_thermal_zone.c:222:2: note: remove the 'if' if its condition is always false
        if (!int34x_thermal_zone->ops)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/thermal/intel/int340x_thermal/int340x_thermal_zone.c:211:9: note: initialize the variable 'ret' to silence this warning
        int ret;
               ^
                = 0
1 error generated.

git bisect pointed to f6f6f9a01374 ("thermal/intel/int340x: Replace parameter to simplify").

I will be happy to test any patch or provide any extra log if needed.


-- 
Regards
Sudip
