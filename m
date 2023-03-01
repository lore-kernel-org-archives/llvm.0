Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98D97F0
	for <llvm@lists.linux.dev>; Wed,  1 Mar 2023 01:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677635467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XBxkSV3/EDKLQRxAeOkAsN53pR9TrYgOmVCIJHPq0rY=;
	b=YnB/7V/evtVP7sw0/K/Qb+yu/yIlU/if+CYHPGWE6T6XkQzoeO8kiAM2wTL5xEXWJJg31F
	/U+3qNVtCATSMu94/AEsXYl1JRLOriI8AEbt7OI7swnX/AMmqkRcV8tQn8U0pEu61m4VDm
	/9puaihqVjG6egjYoy0D4M3MdJpLalU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-BMf4NsIbNee-TgbzbwwShw-1; Tue, 28 Feb 2023 20:51:05 -0500
X-MC-Unique: BMf4NsIbNee-TgbzbwwShw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99112811E6E
	for <llvm@lists.linux.dev>; Wed,  1 Mar 2023 01:51:05 +0000 (UTC)
Received: from [172.64.13.54] (unknown [10.30.33.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 85D811121314;
	Wed,  1 Mar 2023 01:51:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (0/5 SKIPPED): Test report for master (6.2.0,
 mainline.kernel.org-clang, c0927a7a)
Date: Wed, 01 Mar 2023 01:51:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Message-Id: <20049.123022820510600162@us-mta-657.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED
              Test: OK


Kernel information:
    Commit message: Merge tag 'xfs-6.3-merge-4' of git://git.kernel.org/pub=
/scm/fs/xfs/xfs-linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/74982

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/31770=
4
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/31770=
5
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/31770=
6
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/317708
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/31770=
7


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

