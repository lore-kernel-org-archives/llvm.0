Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE50718D
	for <llvm@lists.linux.dev>; Sat, 24 Jun 2023 00:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687565466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cPl1RCxi61wnK0uGeZhRG0TwShWi3KAYlokxfLvagFc=;
	b=ZRrP8yGgziqFzL4PiHNO8Kz4F2wxJb8l+USALvtRdUlFpZ2zMhQQj2jSl6SoSlAUXH0/F9
	WmyIreFXDDpV90bm2sAWa2uo687yERz6kiX22KILaThwc4BsHQGSAXmAByGTO8cXidjVc4
	J3HgpHLmNJOoWrbhuCIQtgQ92bGvuVA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-O0QkTHkaN-ioUqm7rVubuQ-1; Fri, 23 Jun 2023 20:11:04 -0400
X-MC-Unique: O0QkTHkaN-ioUqm7rVubuQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E80A8E44E0
	for <llvm@lists.linux.dev>; Sat, 24 Jun 2023 00:11:03 +0000 (UTC)
Received: from [172.64.4.14] (unknown [10.30.33.216])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 412EA140EBB8;
	Sat, 24 Jun 2023 00:11:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.4.0-rc7,
 mainline.kernel.org-clang, 61dabacd)
Date: Sat, 24 Jun 2023 00:11:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Message-Id: <22256.123062320110400550@us-mta-452.us.mimecast.lan>
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
    Commit message: Merge tag 'sound-6.4' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/tiwai/sound

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/93551

One or more kernel builds failed:
    Unrecognized or new issues:
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/36533=
2


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

