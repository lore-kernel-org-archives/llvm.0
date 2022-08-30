Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEFF625
	for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 09:18:47 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id m3-20020a05600c3b0300b003a5e0557150so501012wms.0
        for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 02:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc;
        bh=AGaSWYBJDgKfuNXBk/rMpd9HzYqxQJNCfvux8aOnciU=;
        b=OkWDZIa6FOObDPg4K064OvXgsu/npv0Y459BFnvrGpjZtayryIOXm//bV7VtE+O6Ku
         Z6wd2miesiJN/ppW2YMSP9cBRqmBKexlGpHQAjEv+y2Eu6lkXXKdYMdSo3EKWztpsW5n
         LDeMJBGtmITWQY6Ini2sc9A4VU7633IBYInTPbSFNVnazdFOhBgmWg49tISF8q2xXT3L
         zZhoSBvCa4634fkQJ++bWj41wbFXDwaxLDCo1mbSHQSoFPQTMB9SDOth0gHv/HUV/AWQ
         VsZZGRgDrYBEB/ip4uuvUBsJkrOnk9bvsp/Dtd8p6BMdIvup4DP62ymW9/8+WGIDGIxX
         zRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=AGaSWYBJDgKfuNXBk/rMpd9HzYqxQJNCfvux8aOnciU=;
        b=VaCy32zm/tB4dvErxZ+Zh4qbywlf4oFC6dWXaU+vHeS1bkDKRUt1D+trRLAyE2sW9h
         T5jzmJujG7I0JIKz3Qwte4rzRMMx7xnPyJiEwK46pIXq00asfdkzN8NvXPQeLPdpbaqR
         dpgQ6MasFYL93yZGRvx+YVpL31A+YOkUxr2O1c+0N3jZCPA87GRUYX/L57jUamGSF+TH
         C2CZU77MPDzbvenzaha9jQc/VLqoNSeA3nyyCnbEXNmKFO9aEW3cKFEBumJTMThgsYn1
         MJf2y+Vma399bpknqiqHzXUfgtVv8kpjVvVgBxnjAIiqmJ3D/moHTj/jf7WVd0xSxUA/
         ekkQ==
X-Gm-Message-State: ACgBeo106UkPYbNKQJQZ8oo8QVv4++a0ggr0iwBMj2qZ/DDcdQuxUmRg
	ePoRzMkajM4YRqB4lp6jdiY=
X-Google-Smtp-Source: AA6agR5QPnPnzmdDQ8z8WSYvFsJyyoFZG9CQ43BYjg2K03qhgWNqHPOigcjYhoX/TqbT6IEa4NyRmQ==
X-Received: by 2002:a05:600c:1f05:b0:3a5:c789:1d9c with SMTP id bd5-20020a05600c1f0500b003a5c7891d9cmr9138971wmb.26.1661851125988;
        Tue, 30 Aug 2022 02:18:45 -0700 (PDT)
Received: from debian (host-78-150-37-98.as13285.net. [78.150.37.98])
        by smtp.gmail.com with ESMTPSA id h15-20020a5d548f000000b0020e6ce4dabdsm9040737wrv.103.2022.08.30.02.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 02:18:45 -0700 (PDT)
Date: Tue, 30 Aug 2022 10:18:43 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	clang-built-linux <llvm@lists.linux.dev>
Subject: build failure of next-20220830 due to 5f8cdece42ff ("drm/msm/dsi:
 switch to DRM_PANEL_BRIDGE")
Message-ID: <Yw3V8yJgAnPD8o6P@debian>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi All,

The builds of arm64 allmodconfig with clang have failed to build
next-20220830 with the error:

drivers/gpu/drm/msm/dsi/dsi_host.c:1903:14: error: variable 'device_node' is uninitialized when used here [-Werror,-Wuninitialized]
        of_node_put(device_node);
                    ^~~~~~~~~~~
drivers/gpu/drm/msm/dsi/dsi_host.c:1870:44: note: initialize the variable 'device_node' to silence this warning
        struct device_node *endpoint, *device_node;
                                                  ^
                                                   = NULL

git bisect pointed to 5f8cdece42ff ("drm/msm/dsi: switch to DRM_PANEL_BRIDGE")

I will be happy to test any patch or provide any extra log if needed.


-- 
Regards
Sudip
