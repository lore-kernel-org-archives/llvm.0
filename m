Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FA71642B
	for <llvm@lists.linux.dev>; Mon, 22 May 2023 20:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684788663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lHKgz2EDe0gp7BQNyRis8VGY8T5co7X0AfEygGWeGyA=;
	b=WsQMGi2r+elBlkmnCqx76WWi6lKigdhoNfGX/MupIFFLzIUHsJSh2iKL9uDoUBD3twv0FE
	MxmOy8YyiwzJDc+H03kSXnY9q+Y1SmK7j5e+9FRbtmUFiN76OniZUIXZN3uw5htEjKWHQY
	yejlct6l0CD1U7PhtdqKeDK5KfzOc7Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-MFinE_PKPMGsSVG43of0tA-1; Mon, 22 May 2023 16:51:01 -0400
X-MC-Unique: MFinE_PKPMGsSVG43of0tA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA0B33C0F364
	for <llvm@lists.linux.dev>; Mon, 22 May 2023 20:51:01 +0000 (UTC)
Received: from [172.64.14.43] (unknown [10.30.33.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C89720296C6;
	Mon, 22 May 2023 20:51:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.4.0-rc3,
 mainline.kernel.org-clang, 421ca22e)
Date: Mon, 22 May 2023 20:51:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Message-Id: <29671.123052216510103050@us-mta-650.us.mimecast.lan>
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
    Commit message: Merge tag 'nfs-for-6.4-2' of git://git.linux-nfs.org/pr=
ojects/anna/linux-nfs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/89768

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/35301=
6


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

