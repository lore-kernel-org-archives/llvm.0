Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F5C883D
	for <llvm@lists.linux.dev>; Wed,  1 Mar 2023 20:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677702067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=77Zo8t0KkIK+w85vDDU6j6+Wa6D0aWpBOb+GRWq6+98=;
	b=LLaDNGJJzraYsv/QP8oAewiPqanwXQ4/y0Ku4nB9GeGogb6Vi31Ph9D591pZFVnTfhhMR9
	cJ+sLOS/cVLZvYIBOdudWPsuRp99RYu4MnACIpwmM7KMDu9PeFmJbrwzidHDbB0BBYmgVb
	JytaZMK9YJXe51N3IJFC4RFdYW/aBPo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-g1hacr2IMeaqGTkIOWfDYw-1; Wed, 01 Mar 2023 15:21:06 -0500
X-MC-Unique: g1hacr2IMeaqGTkIOWfDYw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9CF9858F09
	for <llvm@lists.linux.dev>; Wed,  1 Mar 2023 20:21:05 +0000 (UTC)
Received: from [172.64.14.37] (unknown [10.30.33.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A48D72026D76;
	Wed,  1 Mar 2023 20:21:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (0/5 SKIPPED): Test report for master (6.2.0,
 mainline.kernel.org-clang, 92304df8)
Date: Wed, 01 Mar 2023 20:21:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Message-Id: <68133.123030115210600570@us-mta-571.us.mimecast.lan>
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
    Commit message: power: supply: qcom_battmgr: remove bogus do_div()

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/75200

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/31799=
6
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/31799=
7
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/31799=
8
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/318000
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/31799=
9


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

