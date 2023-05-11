Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336E51B8E0;
	Thu, 11 May 2023 08:07:27 +0000 (UTC)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34B7mJa1011645;
	Thu, 11 May 2023 08:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=7BhGrXryR4YkVjPv6nr89pOCnZ0DVqPu4dyXCCQyNPw=;
 b=TAYuDHXROAN/eYKpJzxeBp7M8/1oWqpjpMeIWXi9gp4ZhqYtdpCmaEoopVsp3YWWS0HD
 EJRkrROxVles8RWXXJ6awrnBMhRJsCruA7w+m9W5xh1ZV1PghZC6AYk0pxOQLpZbA+W6
 cKB1EskG6+QCDHQ9Z7BxUEQexIB0YXZ+GLtOP9das7z64pSdZgVaKgT0NkStPC0A2+KG
 +pFTDTecdU8X3p2WPQ26FbmtkXxb/2iCy/cuy6B7kIecMjdt5PRGx29QGElpy3VPTIT8
 9n7QMc+6nDhMF6RMMz1IuLUJzFQNZmqvHxfesLYKDXh78rtLNw2/M1dlUh7sauHPJocv Tg== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qgcdw424t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 May 2023 08:07:01 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34B68Oqb022465;
	Thu, 11 May 2023 08:06:21 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3qf7e0s81u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 May 2023 08:06:21 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34B86J1P30016176
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 May 2023 08:06:19 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6CA8520040;
	Thu, 11 May 2023 08:06:19 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2BF6020043;
	Thu, 11 May 2023 08:06:19 +0000 (GMT)
Received: from [9.171.64.141] (unknown [9.171.64.141])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 11 May 2023 08:06:19 +0000 (GMT)
Message-ID: <e5c936bbbe81d11fb577098679376c64a83d4d4c.camel@linux.ibm.com>
Subject: Re: [niks:has_ioport_v4 36/41] drivers/usb/host/pci-quirks.c:289:5:
 warning: no previous prototype for function
 'usb_hcd_amd_remote_wakeup_quirk'
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Arnd Bergmann <arnd@kernel.org>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Date: Thu, 11 May 2023 10:06:18 +0200
In-Reply-To: <0474d84f-69cb-4c98-9833-695ed25bc65c@app.fastmail.com>
References: <202305110634.RGuHbrxM-lkp@intel.com>
	 <0474d84f-69cb-4c98-9833-695ed25bc65c@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: X2HVKbEoTdHmHb1zF5JQMKMqVuDTJ_id
X-Proofpoint-GUID: X2HVKbEoTdHmHb1zF5JQMKMqVuDTJ_id
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-11_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 clxscore=1011
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305110065

On Thu, 2023-05-11 at 09:21 +0200, Arnd Bergmann wrote:
> On Thu, May 11, 2023, at 00:31, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git=
=20
> > has_ioport_v4
> > head:   b873f53aa1a6487f4a450747bd5ee38afad6dfe4
> > commit: 216a01adc35d677e5b2db113a4df427faae01e75 [36/41] usb:=20
> > pci-quirks: handle HAS_IOPORT dependencies
> > config: x86_64-randconfig-a014=20
> > (https://download.01.org/0day-ci/archive/20230511/202305110634.RGuHbrxM=
-lkp@intel.com/config)
> >=20
> > > > drivers/usb/host/pci-quirks.c:289:5: warning: no previous prototype=
 for function 'usb_hcd_amd_remote_wakeup_quirk' [-Wmissing-prototypes]
> >    int usb_hcd_amd_remote_wakeup_quirk(struct pci_dev *pdev)
> >        ^
> >    drivers/usb/host/pci-quirks.c:289:1: note: declare 'static' if the=20
> > function is not intended to be used outside of this translation unit
> >    int usb_hcd_amd_remote_wakeup_quirk(struct pci_dev *pdev)
> >    ^
> >    static=20
> >    1 warning generated.
>=20
> It looks like the declaration was dropped by accident, it should
> have been moved into the #ifdef.
>=20
>      Arnd

I think I saw it but assumed that the extern declaration in
include/linux/usb/hcd.h was enough. I guess before this was hidden by
the missing CONFIG_USB_PCI_AMD. Should be fixed now.

I also fixed another issue that broke the build on my x86 workstation
because of missing the "CONFIG_" prefix in the addition of checking
CONFIG_USB_UHCI_HCD for the uhci_ quirks. This "CONFIG_" prefix
mismatch between Kconfig and code got me at least 3 times by now=E2=80=A6

Thanks,
Niklas
