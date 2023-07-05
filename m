Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0969314AAE
	for <llvm@lists.linux.dev>; Wed,  5 Jul 2023 19:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688584806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KWw/d4qbCASfsCZ3m7f98ZfI4BA+Hl7XVjo489Rbbgo=;
	b=S0iRh/OyPcd+iYKM4XAZcQ3Kb7qyf35OgXYVzb7ZXahkcOaY29KEqf88uRtOdHrGw3FjWL
	7iIRXzZMWsQoJ9yi6SmEZSBaall4XfJ5EtBWycj2jmHiwxBlpNegVz6QttsN4bL6U4RfLh
	zf3UuONumNgT0giviT34RI4HlGs4qgo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-B0kCkWGiOSCvdnTzjqvMyA-1; Wed, 05 Jul 2023 15:20:05 -0400
X-MC-Unique: B0kCkWGiOSCvdnTzjqvMyA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6172B8030AC
	for <llvm@lists.linux.dev>; Wed,  5 Jul 2023 19:20:05 +0000 (UTC)
Received: from [172.64.15.54] (unknown [10.30.34.186])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4DAF24087C6A;
	Wed,  5 Jul 2023 19:20:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.4.0,
 mainline.kernel.org-clang, fe1de551)
Date: Wed, 05 Jul 2023 19:20:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Message-Id: <78589.123070515200501478@us-mta-474.us.mimecast.lan>
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
    Commit message: Merge tag 'soundwire-6.5-rc1' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/vkoul/soundwire

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/94937

One or more kernel builds failed:
    Unrecognized or new issues:
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/36989=
8


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

