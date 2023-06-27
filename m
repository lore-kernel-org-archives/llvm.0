Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD311ACB4
	for <llvm@lists.linux.dev>; Tue, 27 Jun 2023 20:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687897807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kzUfIDbiwtJIhVJyiSwaygzZPH1Dphklvi6Mg+bT5fU=;
	b=GeUTCFd6Q/NxfoZo7rhLwBU+/WO+3WVZ+wygDkJIdw32tTbwFnEpUgz1jfix0wmdyE/NrQ
	nUowdSrwqVXW37heBps7OokwzIUOtddFG11Fal012Hl9ZIeIGwHVQsEwP/BSlB0KCF2Ng0
	sJpi/Zx3BDnBVHj8eJr+ypx634s1rjk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-YDcgwODyPSaAQ49d4mOMDQ-1; Tue, 27 Jun 2023 16:30:05 -0400
X-MC-Unique: YDcgwODyPSaAQ49d4mOMDQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5780C185A7A2
	for <llvm@lists.linux.dev>; Tue, 27 Jun 2023 20:30:04 +0000 (UTC)
Received: from [172.64.9.13] (unknown [10.30.34.230])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4719DC00049;
	Tue, 27 Jun 2023 20:30:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.4.0,
 mainline.kernel.org-clang, 04fc8904)
Date: Tue, 27 Jun 2023 20:30:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Message-Id: <10136.123062716300500326@us-mta-636.us.mimecast.lan>
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
    Commit message: Merge tag 'docs-arm-move' of git://git.lwn.net/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/93849

One or more kernel builds failed:
    Unrecognized or new issues:
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/36638=
5


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

