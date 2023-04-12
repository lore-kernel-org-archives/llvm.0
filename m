Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCC2364
	for <llvm@lists.linux.dev>; Wed, 12 Apr 2023 02:05:13 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33BLOHtk017631;
	Wed, 12 Apr 2023 02:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2023-03-30;
 bh=Ha3a400CAiTec58ANgs9x2pATmfUTa3naf8F6KCf2KE=;
 b=c01JmUw7TTH+3WH9tFJe1EIE5z+hvcOOkt2Bl7dtzJBXLYpoEMqmhdlb9PON+Banss1z
 rV+B+xYkNI0rGmJvpiUZ8aCtlI0GCDORN/q2dFu0m9HjZFPfDJL50KtMfn2XNGub37BW
 DzYypfU7kHOOAy0dBoyr/SMEN47Z5WNuFtjP1DDo7rj47vO73I/mtrngA1n2WutIb82N
 4dQHDC/Un3Ic/3VVrEnMtOBx01T/gY0amDLLtFEcAWP8qcVJbaEyrDD8RxA5t9+LcwCy
 zvbMjVBdpG1xw8fveO4dbxJfvtriy7pm2z/7k38MtHjOXC0mgBGEP1b/+rZXFn5j4f0h Lw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pu0bvxy18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Apr 2023 02:05:02 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 33BNiwbC008044;
	Wed, 12 Apr 2023 02:05:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3puwc54tuf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Apr 2023 02:05:01 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33C24xeU031283;
	Wed, 12 Apr 2023 02:05:00 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3puwc54tqc-5;
	Wed, 12 Apr 2023 02:05:00 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: skashyap@marvell.com, jhasan@marvell.com, jejb@linux.ibm.com,
        nathan@kernel.org, ndesaulniers@google.com, Tom Rix <trix@redhat.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        GR-QLogic-Storage-Upstream@marvell.com, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] scsi: qedf: remove unused num_handled variable
Date: Tue, 11 Apr 2023 22:04:45 -0400
Message-Id: <168126077054.185856.13251025370655544447.b4-ty@oracle.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330203444.1842425-1-trix@redhat.com>
References: <20230330203444.1842425-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-11_16,2023-04-11_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 mlxlogscore=683 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304120016
X-Proofpoint-GUID: aNNXGMz8qNNCYki8flbyngCloxqltxfs
X-Proofpoint-ORIG-GUID: aNNXGMz8qNNCYki8flbyngCloxqltxfs

On Thu, 30 Mar 2023 16:34:44 -0400, Tom Rix wrote:

> clang with W=1 reports
> drivers/scsi/qedf/qedf_main.c:2227:6: error: variable
>   'num_handled' set but not used [-Werror,-Wunused-but-set-variable]
>         int num_handled = 0;
>             ^
> This variable is not used so remove it.
> 
> [...]

Applied to 6.4/scsi-queue, thanks!

[1/1] scsi: qedf: remove unused num_handled variable
      https://git.kernel.org/mkp/scsi/c/7866e03b9825

-- 
Martin K. Petersen	Oracle Linux Engineering
