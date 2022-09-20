Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CED81C03
	for <llvm@lists.linux.dev>; Tue, 20 Sep 2022 11:47:54 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id r133-20020a1c448b000000b003b494ffc00bso6132519wma.0
        for <llvm@lists.linux.dev>; Tue, 20 Sep 2022 04:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date;
        bh=Uzqu4x3ReJl2swGfEJj67Pd2unDJ3Dv2X7PfUeAMFlU=;
        b=CmXkA8qIbaFNouX5UDIP2EtzvEpNmgRhb/8rznaJhGMNUuwBOFHghs3gJQS4uomnZr
         YDcqkjuEvJ4vCka5cONnCHVRV6iQInH+8o7Zq6VeC/3C8HUmiQ31Tc1D7RqHoZMY0+gl
         DpJVgqTY9VSsYXVMFHySjCx4npqW7qGsRD7k6vyHOfIxIklfFsHo9utUqClMbHOH7nzv
         xKq4OLNK7WWtv23lHrNAz+KZYWDVjodkcEtoVo4NkPp0a/0giowcL+JsMfRSnh9PfBq2
         GPBjK8DY/TfnAMRV+kChdRhMBeamsBENpwI9RfDCDpHENBnE3x1TJgyEn6gEeFu9Vrxg
         wbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Uzqu4x3ReJl2swGfEJj67Pd2unDJ3Dv2X7PfUeAMFlU=;
        b=GukTSw5gTBO+cC+//JL/iXa6OXHfR7+2eJXa25i89Gw87ko8bhQeB4lQD0xNhUqg7I
         2AC+Z62zkdlNCwuF3F7dl2L6NHymcJWMQxy9N12hrrBvFkxvZBqxEzZzunGikBCZv0ls
         irctgKTujhjVWBGqkD48y1PWGq9ndpZyvHsak/6hGBnqIIHxAylMTtSf4R8Zy7c7ZTvQ
         YnqEc6bfGnHnTD+vr98eiVSWofElYlYmuDWvw6MuiPzAQ7JnNV1nshIpnxuaN8u3RBvo
         M5wMoMx/QdntDdiOPe8qf6tvpDyynZ/+rEC5i9bkl5uIsr2wxCmHm44sINBJH3s2dO4+
         1InQ==
X-Gm-Message-State: ACrzQf3sUPc5A9Yi/6sr/FfJax5bPL9uSosBE5rNyrrwPQgiU2vWsaIA
	vSoZmf0XvY+pQ8jBv+Ya5XA=
X-Google-Smtp-Source: AMsMyM4aBYcaHzJkBzdvhpxsTIJL1CmLJ4dHjh82nS5T2kmR/xQCQfB8ki9IGbZoXjIWTpnN0yGzMA==
X-Received: by 2002:a1c:f009:0:b0:3b4:9398:49c9 with SMTP id a9-20020a1cf009000000b003b4939849c9mr2085385wmb.174.1663674472131;
        Tue, 20 Sep 2022 04:47:52 -0700 (PDT)
Received: from debian (host-78-150-37-98.as13285.net. [78.150.37.98])
        by smtp.gmail.com with ESMTPSA id b20-20020a05600c4e1400b003b33de17577sm2254667wmq.13.2022.09.20.04.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 04:47:51 -0700 (PDT)
Date: Tue, 20 Sep 2022 12:47:49 +0100
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Philip Yang <Philip.Yang@amd.com>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-next@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	llvm@lists.linux.dev
Subject: build failure of next-20220920 due to c2b08e7a6d27 ("drm/amdgpu:
 move entity selection and job init earlier during CS")
Message-ID: <YymoZR0jHR7seGyU@debian>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi All,

The builds of arm64 allmodconfig with clang failed to build next-20220920
with the error:

drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1190:3: error: variable 'r' is uninitialized when used here [-Werror,-Wuninitialized]
                r |= !amdgpu_ttm_tt_get_user_pages_done(bo->tbo.ttm);
                ^
drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1171:7: note: initialize the variable 'r' to silence this warning
        int r;
             ^
              = 0
1 error generated.


git bisect pointed to c2b08e7a6d27 ("drm/amdgpu: move entity selection and job init earlier during CS")

I will be happy to test any patch or provide any extra log if needed.


-- 
Regards
Sudip
