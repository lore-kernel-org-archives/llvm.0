Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
	(using TLSv1.2 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29843D6B
	for <llvm@lists.linux.dev>; Wed, 16 Mar 2022 23:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1647472758; x=1679008758;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=/CvDxUBjZUpW6SgceaqsCS1Q4typ2dhyPjtjHk2B1nI=;
  b=no3HjY7OiGXgJxGsWxKliBCVu1jyv0H1fZz5jnUL5BKmXOZP1O0Q//06
   EN0Wm1dyB8NOSBZ+6i4hYxhZG5lK3+TX5A5zxbs+ZCkIgmu/HF2hMNYco
   OfpMHymZOilGeqwZ1Ictvim8B3CmOmmIXgbtZsHO2gKHyHdsfw6/jyAmy
   s=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 16 Mar 2022 16:17:08 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2022 16:17:08 -0700
Received: from [10.110.68.151] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 16 Mar
 2022 16:17:07 -0700
Message-ID: <15ebcddf-a84d-7293-f672-0e8ec47537e8@quicinc.com>
Date: Wed, 16 Mar 2022 16:17:06 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] soc: qcom: smem: use correct format characters
Content-Language: en-US
To: Bill Wendling <morbo@google.com>, Andy Gross <agross@kernel.org>, Bjorn
 Andersson <bjorn.andersson@linaro.org>, Nathan Chancellor
	<nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	<linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>
References: <20220316213118.2352683-1-morbo@google.com>
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <20220316213118.2352683-1-morbo@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)

On 3/16/2022 2:31 PM, Bill Wendling wrote:
> When compiling with -Wformat, clang emits the following warnings:
> 

I thought we have -Wno-format by default enabled for arm64, isn't it?

---Trilok Soni
