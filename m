Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8691631F10
	for <llvm@lists.linux.dev>; Wed, 17 May 2023 18:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684348207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aExKJpnK9g3OxaVre+uLOfPZYwQnT6pAdxW0MSB4Pl4=;
	b=fVEQP4SE87OytvyQnrd2r1aIp9G5zaQOB4eGnRJc3XDsXO8pnN1jpo/dasK9xfgmF8TuZF
	Nbdir7QfofhfxWCAc8VEOWTnSTJANDri4IXKZ3rmnVMKx0UA5q/y6gGY4OidhzipcK3Idj
	dOOgUfs320+bWC78h2VjaX4vYVmJt6k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-323-4fsJYkUMMDGWVLLeaRNJ9g-1; Wed, 17 May 2023 14:30:05 -0400
X-MC-Unique: 4fsJYkUMMDGWVLLeaRNJ9g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 534682A5955F
	for <llvm@lists.linux.dev>; Wed, 17 May 2023 18:30:04 +0000 (UTC)
Received: from [172.64.15.20] (unknown [10.30.34.186])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 404CF40C2063;
	Wed, 17 May 2023 18:30:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.4.0-rc2,
 mainline.kernel.org-clang, 1b66c114)
Date: Wed, 17 May 2023 18:30:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Message-Id: <05487.123051714300500845@us-mta-323.us.mimecast.lan>
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
    Commit message: Merge tag 'nfsd-6.4-1' of git://git.kernel.org/pub/scm/=
linux/kernel/git/cel/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/89186

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/35108=
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

