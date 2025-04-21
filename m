Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0891A304A
	for <llvm@lists.linux.dev>; Mon, 21 Apr 2025 18:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745261093; cv=none; b=r2SXwI0/PJOyKeUemujNZ6+8Wv+TyV/qeze0itWeV5aLjXzNxXRTSx211IGclhVkqbdd6toHupi+dhRe19FNLAfUkqIY1GgcSzAjg4yGOYjIUTXanwKqHSZg9HVyRhPRCAOUmof49AJS+PlPxxJVEz2eEDsB3LLhusISuBTTA14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745261093; c=relaxed/simple;
	bh=4NTNZ7kRwuNfDxpSzwP4LyO5D/370ZD8+egSjrKvECI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZrXDXVMfSR0apvk17BYuOGVKwgAlbUy9tXO0f16mu4nMUhzN7WG56sIO7a13ip6V03EE1eR37uCTwlW8FXcc/XsVfzCkigHfdWCwF51zLmk5QFoFGylhTxxtARtE7sV2Sap3KhdA6ZD39rtG6Ya0f5bCcj6qBstT+79Ofrlw0H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZDIniHKn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZDIniHKn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LIgpFG030909
	for <llvm@lists.linux.dev>; Mon, 21 Apr 2025 18:44:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UtRScXxIHm6oxt6nV96BNJpPBcZBVBaxFiOva74/L34=; b=ZDIniHKnxVIunbVG
	SQU2BDP1upbXg5y+6qmUDGhoPvYsYbSdpoeYBV0dZ07C/NMfWzXNCK1LJUHuMBUN
	aQAdI/IL4fh8MEveL39+rQ2mC+g6o6VlQusA7cbBuWZReJM2EcYPOfiMrOdbwq9n
	4KLk+UChODRUsMlvoWo27Z44d863pjWxzH4JcqsFhszglTbu5i0AF45HofFzYlGt
	7ec0aV/gIIFuERCmuGLjtdSGIO8YKHT4QJomDuqNyiQVJXMNZdVQjAViIQpFcZtS
	7TL4iz0jxbEkdpV77SAhT7nTS2+aSgKYIWCKwZYLVQmcsOCz5reGRmCwZnCSOwd6
	a/ATQA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46435jd21u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 21 Apr 2025 18:44:50 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b0e0c573531so1585622a12.3
        for <llvm@lists.linux.dev>; Mon, 21 Apr 2025 11:44:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745261089; x=1745865889;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UtRScXxIHm6oxt6nV96BNJpPBcZBVBaxFiOva74/L34=;
        b=Ex4Town23lMEQDPPT4f7YXKqis1MOvag4M+ipjfZP0XPTtUh3WpgcbKehEh8lXpcza
         ijKpOasUtFDH+6eEjDfpes5DW06Qz6IcRmJgEnG9ctOJ0NLb59Wa98doYQU1YRKDoG8J
         K6OXJEe4G2ftbRiiyjlLAUMiSjdPUAkfU2hgngs1x+4h0mEDQ7XFrxlYMOnqeupG/2/O
         Q1l6XtaTU5X5sAIhPNB5uQsjo5EFcEjcH/1Z4YfNnpypSVB0URAam3B5wUN3Gvrz3/ev
         pFEPRT2vHz3Xvlw+zvjq1AK2iYIT9bu/byl50RbqF/wbdoPr+XxLcBvV9bafpz6Oed9n
         yLxw==
X-Gm-Message-State: AOJu0YxW3Qcsiv0WhqYmcYgfu0m9rB1XsL2Rdk1wfTgOAmBE/9X9Bvjc
	E7SAkwJSEI/8l4kLt7RkAf9i/4md9sytGZjhsDyQjqG74Ih1r250ghy2qUZWgtEuT0D4oZ5lf97
	VIUjtKNpK86xEHuyz5VHEzeExTbqC835zrKmE/yi9A4+aO4Q/E0mo
X-Gm-Gg: ASbGncsmx9+QP2+E7twSmMOs/bRCK8ceZrLnt/1lB/2s9EKtsbsEHBNPURO9S/fNR/e
	Xf4uW1iVZX/EAhqblw4Setlh6X/M/xUCxNJSyABYyBr3e17NcC09kdQxta561ebVCNMAiBsOvGC
	AYwvtqO+1Y/xaG1tEoRR6qh6h5UgslAPiJ0ljp2zBEJSH0xebrJUsnhaIt6Ghv1X/6JotJOaWID
	1ELQuV/cAgoSs88hFuvMPaU06lHGi3F20N3sLXbxxhFLdQ2n9PzZFI6LFYsFi20qf6LFMgDolzj
	LVNwfM+nurwztLXVLWM6XiUi6IZ8YyKybiBr7sQpG5TjI7p7FepBMy/e1gtoCGcnkLd/eAbDbjP
	Tn/aR
X-Received: by 2002:a05:6a20:9f09:b0:1ee:e655:97ea with SMTP id adf61e73a8af0-203cbd60a89mr19672754637.41.1745261088714;
        Mon, 21 Apr 2025 11:44:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA0pK6tF2JhEK8ouZupmBtQFU+yOMOxYbB5tNIrlUqNDVEr9iX1u+Kx1ALJ2l8+cvsKSayMw==
X-Received: by 2002:a05:6a20:9f09:b0:1ee:e655:97ea with SMTP id adf61e73a8af0-203cbd60a89mr19672724637.41.1745261088351;
        Mon, 21 Apr 2025 11:44:48 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0fd23599cesm2989744a12.59.2025.04.21.11.44.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 11:44:48 -0700 (PDT)
Message-ID: <47ea4e64-cd87-4c42-a20d-f663f197e44c@oss.qualcomm.com>
Date: Mon, 21 Apr 2025 11:44:46 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: allow beacon protection keys to be
 installed in hardware
To: kernel test robot <lkp@intel.com>,
        Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-wireless@vger.kernel.org
References: <20250421114711.3660911-1-karthikeyan.kathirvel@oss.qualcomm.com>
 <202504220128.2KvxCzaG-lkp@intel.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <202504220128.2KvxCzaG-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EOYG00ZC c=1 sm=1 tr=0 ts=68069222 cx=c_pps a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=p4PaQEVxqj5bAbq44HAA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 2KpjDCUxBs5f1wVMe7VYo-zZG1YmWZo1
X-Proofpoint-ORIG-GUID: 2KpjDCUxBs5f1wVMe7VYo-zZG1YmWZo1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_09,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=590 mlxscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210146

On 4/21/2025 10:16 AM, kernel test robot wrote:
> Hi Karthikeyan,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on d33705bb41ff786b537f8ed50a187a474db111c1]

lkp@intel.com folks:
This patch contains the following footer:

base-commit: d33705bb41ff786b537f8ed50a187a474db111c1
Depends-on: <20250421111505.3633992-1-karthikeyan.kathirvel@oss.qualcomm.com>

Is there a different mechanism needed to tell the robot about the dependency?

