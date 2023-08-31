Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC875399
	for <llvm@lists.linux.dev>; Thu, 31 Aug 2023 21:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693516265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=E1bucT54uNkgCF+nYeR5ou7KrjHbpjORrL0Sog4UPKQ=;
	b=dDwt271SrB0ibIoLaFAy3u+4cmbaiUJNocZrrnDThL9s52sr6r+OpLipaEqZJ4q4CJY6Nu
	Me5l+4r+XnVc9eFf1iTwvhXN+V2cnjA/VTqqt2W7+Vs57JFfWsyPjsadVstPIMspxP3f4/
	2ZFD6ewoRH6toMR29tvaPG2glrg/+iM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-4FVRT8qVOqC5_qCrT-qeiA-1; Thu, 31 Aug 2023 17:11:04 -0400
X-MC-Unique: 4FVRT8qVOqC5_qCrT-qeiA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0DB23C0CF1B
	for <llvm@lists.linux.dev>; Thu, 31 Aug 2023 21:11:03 +0000 (UTC)
Received: from [172.64.14.60] (unknown [10.30.33.250])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC6B4492C13;
	Thu, 31 Aug 2023 21:11:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.5.0,
 mainline.kernel.org-clang, 87dfd85c)
Date: Thu, 31 Aug 2023 21:11:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Message-Id: <77736.123083117110400429@us-mta-576.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED
              Test: SKIPPED


Kernel information:
    Commit message: Merge tag 'for-linus' of git://git.armlinux.org.uk/~rmk=
/linux-arm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/102530

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/39277=
1


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

