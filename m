Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFBA1172E
	for <llvm@lists.linux.dev>; Fri, 11 Aug 2023 17:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691776265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lD30eh/aGf0Q5Bslfr2nm6Jc+BlTVyjSUj0JRL2Pf4M=;
	b=cTerPbC/Hzjnd6xQjzOpu0nT695XJ5bYZnSIMbqeFPguUk4sEqq3fVksoC6oxPVXSnOGjD
	KcbVlV+hgtqTA2KwuxVRfHtKRMW6vwalFaDxzlYTA5/ySGzk7+8TXYEzN8La6dE/lmLPZ9
	Vl4g+7bgE+Bqc0imtMv6S6xyHqgNagI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-DTEUqIPRPMq_a24pSX0vbQ-1; Fri, 11 Aug 2023 13:51:04 -0400
X-MC-Unique: DTEUqIPRPMq_a24pSX0vbQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE5D48DC660
	for <llvm@lists.linux.dev>; Fri, 11 Aug 2023 17:51:03 +0000 (UTC)
Received: from [172.64.4.35] (unknown [10.30.33.216])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A9ABF2026D4B;
	Fri, 11 Aug 2023 17:51:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.5.0-rc5,
 mainline.kernel.org-clang, 9106536c)
Date: Fri, 11 Aug 2023 17:51:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Message-Id: <06513.123081113510400579@us-mta-447.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'pci-v6.5-fixes-1' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/pci/pci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/99712

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/38450=
3
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/384504


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

