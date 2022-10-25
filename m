Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AE12F2F
	for <llvm@lists.linux.dev>; Tue, 25 Oct 2022 20:24:02 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id ml12so8596473qvb.0
        for <llvm@lists.linux.dev>; Tue, 25 Oct 2022 13:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u11EWAKeLUJjTlcgljXJYk/tXJByUFK75HMgC2lMe7k=;
        b=SQQuGKX2fxIJZySXey4OiS/VwQA6X75XgjJZiwbO2QDm1SqCfQClRfLEPmXTGtb7R8
         Q/NJ3mX3dDATuQenL7R7QNaA+lx/kZtMfVTCGNYgq3iQOgkZ4yeq6uYWibwWjJLwOLtT
         dqbTk00iEiLJ49eXdOUWPOcqvHWoNSIdBV1JBEFK9AK893TmXijWPQDHpZtbjom0H9SZ
         YmPZtrnje63XQOh95NRocjV5keb7br7v+ugt++bPVfWOwruV0k+uUN9x5yBB+BOTweEl
         +5OAjv48h4UC+UEuOf3LyByff+N7YzHn+QeYoH6z5gJ7kGhSVFrAVz89GGJLv9ZKxtRt
         AyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u11EWAKeLUJjTlcgljXJYk/tXJByUFK75HMgC2lMe7k=;
        b=i/P6OEk7nZZq+A5ubZrgxQrvTjvtjVQ3HJHrfJazO9+THv6TqbUDvzKGuiwonpTw+u
         PgsKqx8WPCrU14rjy+LMq7/baO/Lp/3g96FwW5tmKBEP4DPbR5zBAXYMZNNB4+SeVL85
         HoJlS4qC++r8Vvc5D9m3MXCs+3rl766nwRlki32u/vyR8UDCFo4IQOliAfTFOUqP9r4O
         UJOJ1JPYZNKhldXDlxeeTE5Z6PeraAWH8Db0H3RbU00JiQ1wuR1IjhTfz9TeF4fWjWB8
         umIiriLH4vBHMqkSxlqk1++ge/RNOrME3imAY+qvNa1ZEsGTykI7W1zUVXo8GAx6Vtqx
         hYZA==
X-Gm-Message-State: ACrzQf0y76CP3U1n86RbCi2dTWeffkes4+A51tnq2dcp7T97YmLsdj9E
	aGMH8Pz5ypgUYd49d56wA8yUqxNvpvKyWQ==
X-Google-Smtp-Source: AMsMyM6PsF6KdDeegyUvkmj4HLJqUk4RCyc/VLSpaSVCQOeD9o5flGNTttvr0ss/q2yKmqA+/jOA5w==
X-Received: by 2002:a17:902:db0b:b0:185:51cc:811a with SMTP id m11-20020a170902db0b00b0018551cc811amr40037503plx.85.1666729430027;
        Tue, 25 Oct 2022 13:23:50 -0700 (PDT)
Received: from google.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id t4-20020a170902d14400b0017dd839f2a5sm1581616plt.38.2022.10.25.13.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 13:23:49 -0700 (PDT)
Date: Tue, 25 Oct 2022 13:23:45 -0700
From: Zach O'Keefe <zokeefe@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Gautam Menghani <gautammenghani201@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	patches@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mm/khugepaged: Initialize index and nr in collapse_file()
Message-ID: <Y1hF0bQL6CbueBe/@google.com>
References: <20221025173407.3423241-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221025173407.3423241-1-nathan@kernel.org>

Thanks for the fix, Nathan,

Best,
Zach

Reviewed-by: Zach O'Keefe <zokeefe@google.com>
