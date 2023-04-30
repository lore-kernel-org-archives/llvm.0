Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64088364
	for <llvm@lists.linux.dev>; Sun, 30 Apr 2023 02:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682820067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=15ONDNyCLh4mnIX3+sdotSmjz32NzjBnfRYHevxHFq8=;
	b=bBEdNsiyvKi6R1JPtuy5q0wPyPmAk6toQWwDfcr37ZW3LcMmPuw5Ppm5BrK6iou8KQHWiZ
	Q5jkPYARR11SXRv2udbBGWdhi3VNJnT2vNXQsU414r4YnAa4wCYZaV8hzoYHGcGoWmU6wl
	99aYFG5wato5kt4opdyUYlsQ60hl2DU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-eQAwP3R_MbS4uCKfHUY-xQ-1; Sat, 29 Apr 2023 22:01:05 -0400
X-MC-Unique: eQAwP3R_MbS4uCKfHUY-xQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D1268314E8
	for <llvm@lists.linux.dev>; Sun, 30 Apr 2023 02:01:05 +0000 (UTC)
Received: from [172.64.3.52] (unknown [10.30.33.173])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3AF3E406AA66;
	Sun, 30 Apr 2023 02:01:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.3.0,
 mainline.kernel.org-clang, 825a0714)
Date: Sun, 30 Apr 2023 02:01:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Message-Id: <11812.123042922010500585@us-mta-175.us.mimecast.lan>
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
    Commit message: Merge tag 'efi-next-for-v6.4' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/efi/efi

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/86592

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/34177=
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

