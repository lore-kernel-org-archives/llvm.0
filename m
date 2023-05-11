Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D35B1C754;
	Thu, 11 May 2023 09:55:59 +0000 (UTC)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34B9dR1J029743;
	Thu, 11 May 2023 09:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=QphF3i7Owk60jQhf1JGMIdiz+4HwrY32+434M37ri7I=;
 b=eGarYgwccJMyRWUxnlZ+TsMN3QW4WLjInUImIMXFvUc1XquoiO4eaobObVE8QXrufFmx
 4kjKlRwymEBREQc9RfDMfmZyajY6A0hCcYw/UIFAchPWY7+/oVdg7klHCD2jsyhlbuT1
 qpnjHozhAI3xY1Dhvch4Xgs+TRtI4vK63fqka9K4P2ja37PEaty/ejwGoGfasGAGlEE8
 g5CFV1juH7bPNI+3Gq3yjsEdH5yQDeDo4j2JMVRiOGLrCYg+b9bwOp36nxMWSN18XaFZ
 vwS+eb7oGYFrNogs1x2Ke7hV7zFsS62phjxCxxq6Km2jlpTWzmYRW2tHyNH4R1/YgXkL Lg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qggryxu3d-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 May 2023 09:55:52 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34B4rLa7003397;
	Thu, 11 May 2023 09:34:55 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3qf7nh1jud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 May 2023 09:34:55 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34B9YrpS5440130
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 May 2023 09:34:53 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7898A20040;
	Thu, 11 May 2023 09:34:53 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E81A2004D;
	Thu, 11 May 2023 09:34:53 +0000 (GMT)
Received: from [9.171.64.141] (unknown [9.171.64.141])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 11 May 2023 09:34:53 +0000 (GMT)
Message-ID: <c593b7b3f3d42545ca07424a6ab5afb268c150a2.camel@linux.ibm.com>
Subject: Re: [niks:has_ioport_v4 36/41] drivers/usb/host/pci-quirks.c:289:5:
 warning: no previous prototype for function
 'usb_hcd_amd_remote_wakeup_quirk'
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Arnd Bergmann <arnd@kernel.org>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Date: Thu, 11 May 2023 11:34:52 +0200
In-Reply-To: <73615d5f-d507-42aa-8689-7e80093c9f75@app.fastmail.com>
References: <202305110634.RGuHbrxM-lkp@intel.com>
	 <0474d84f-69cb-4c98-9833-695ed25bc65c@app.fastmail.com>
	 <e5c936bbbe81d11fb577098679376c64a83d4d4c.camel@linux.ibm.com>
	 <73615d5f-d507-42aa-8689-7e80093c9f75@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AG-eAHDDMt_R8P_wgd48iPSsgSPLIGrD
X-Proofpoint-GUID: AG-eAHDDMt_R8P_wgd48iPSsgSPLIGrD
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
 definitions=2023-05-11_06,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305110081

On Thu, 2023-05-11 at 10:49 +0200, Arnd Bergmann wrote:
> On Thu, May 11, 2023, at 10:06, Niklas Schnelle wrote:
> > On Thu, 2023-05-11 at 09:21 +0200, Arnd Bergmann wrote:
> > > On Thu, May 11, 2023, at 00:31, kernel test robot wrote:
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.=
git=20
> > > > has_ioport_v4
> > > > head:   b873f53aa1a6487f4a450747bd5ee38afad6dfe4
> > > > commit: 216a01adc35d677e5b2db113a4df427faae01e75 [36/41] usb:=20
> > > > pci-quirks: handle HAS_IOPORT dependencies
> > > > config: x86_64-randconfig-a014=20
> > > > (https://download.01.org/0day-ci/archive/20230511/202305110634.RGuH=
brxM-lkp@intel.com/config)
> > > >=20
> > > > > > drivers/usb/host/pci-quirks.c:289:5: warning: no previous proto=
type for function 'usb_hcd_amd_remote_wakeup_quirk' [-Wmissing-prototypes]
> > > >    int usb_hcd_amd_remote_wakeup_quirk(struct pci_dev *pdev)
> > > >        ^
> > > >    drivers/usb/host/pci-quirks.c:289:1: note: declare 'static' if t=
he=20
> > > > function is not intended to be used outside of this translation unit
> > > >    int usb_hcd_amd_remote_wakeup_quirk(struct pci_dev *pdev)
> > > >    ^
> > > >    static=20
> > > >    1 warning generated.
> > >=20
> > > It looks like the declaration was dropped by accident, it should
> > > have been moved into the #ifdef.
> > >=20
> > >      Arnd
> >=20
> > I think I saw it but assumed that the extern declaration in
> > include/linux/usb/hcd.h was enough. I guess before this was hidden by
> > the missing CONFIG_USB_PCI_AMD. Should be fixed now.
>=20
> Ok. It looks like linux/usb/hcd.h is just not included in quirks.c,=20
> so adding an #include should also fix it.
>=20
>      Arnd

It feels a little cleaner to keep it in pci-quirks.h where it was
before the patch. I just wonder if we then also need an #ifdef
CONFIG_USB_PCI_AMD around the extern declaration?

Thanks
Niklas
