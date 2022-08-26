Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074104C74
	for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 19:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661542208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QSBTgAkm0SaYb8DW7gR+dgkZTqYU/q+rNDOIFkFmPGA=;
	b=BabThPrSb7hjBI12z0g8J5tAqihniInCwSDwkooiZTaNKH88wPII/0x6iFWzNlVGEEiOji
	JoeAz5nRNXN44FXlApGERt3NBPdrkWzYWYrHwIrKI0Z4h3kYSb19hE55Y4Mo8savYcgqxF
	mlmy1kceoER2Rwu5zMjS5q16ssuYAYc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-grgQo5AWP5qmPYzhMZ1kSg-1; Fri, 26 Aug 2022 15:30:07 -0400
X-MC-Unique: grgQo5AWP5qmPYzhMZ1kSg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71BC2101A56D
	for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 19:30:07 +0000 (UTC)
Received: from [172.64.3.119] (unknown [10.30.33.184])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 63C5E40C141D;
	Fri, 26 Aug 2022 19:30:07 +0000 (UTC)
From: cki-project@redhat.com
To: llvm@lists.linux.dev
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.0.0-rc2,
 mainline.kernel.org-clang, 3e5c673f)
Date: Fri, 26 Aug 2022 19:30:05 -0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Message-Id: <68745.122082615300701817@us-mta-616.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'block-6.0-2022-08-26' of git://git.kernel.dk=
/linux-block

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/51844

One or more kernel builds failed:
    Unrecognized or new issues:
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/25453=
2

One or more kernel tests failed:

    Unrecognized or new issues:
          x86_64 (debug) - kselftest build - bpf
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4961666



If you find a failure unrelated to your changes, please tag it at https://d=
atawarehouse.cki-project.org .
This will prevent the failures from being incorrectly reported in the futur=
e.
If you don't have permissions to tag an issue, you can contact the CKI team=
 or
test maintainers.

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

