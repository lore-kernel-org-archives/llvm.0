Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD42136F
	for <llvm@lists.linux.dev>; Wed, 26 Apr 2023 02:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682475010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N5N4zfrsLCgnfmGKZVRVskmr3j43q/4ADgcqjmwq6/8=;
	b=CElGq8tG4iIvQ9byO0wQR9zXDPOAvrWHiLVr48TId6DgK0XPNgDISa+G9pO5nlNv2ttLDZ
	31uCGG1kne2da3z6jwnvZJ76Mmen+8ZkpGqzMnyzv2zHTxywP2Ez6QrEk55lfN6GGX9i91
	fyxEGBWA2TMaC+uzlA7n5G4eLd2Nbvk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-L9p6stVoPW2Y8o2wTCDbLg-1; Tue, 25 Apr 2023 22:10:08 -0400
X-MC-Unique: L9p6stVoPW2Y8o2wTCDbLg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81AB8185A792
	for <llvm@lists.linux.dev>; Wed, 26 Apr 2023 02:10:07 +0000 (UTC)
Received: from [172.64.2.76] (unknown [10.30.34.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6F2F8492B0F;
	Wed, 26 Apr 2023 02:10:07 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4o+t77iP?= SKIPPED: Test report for master (6.3.0,
 mainline.kernel.org-clang, 4173cf6f)
Date: Wed, 26 Apr 2023 02:10:07 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Message-Id: <02509.123042522100800159@us-mta-240.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: SKIPPED
             Merge: OK
           Compile: FAILED
              Test: SKIPPED


Kernel information:
    Commit message: Merge tag 'hwmon-for-v6.4' of git://git.kernel.org/pub/=
scm/linux/kernel/git/groeck/linux-staging

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/86052

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/33990=
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

