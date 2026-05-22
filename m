Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E43833F8C4
	for <llvm@lists.linux.dev>; Fri, 22 May 2026 05:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779426132; cv=none; b=TfuLGO6mBpG0sA5cwxEYw70A9ixQZSvqnI9rQWqrmLYRY+pnUuv/WgOALUS5qj4dxFX8z6fwnmpde2fFZq/u4snG96u+VJWKDW2smUfJWNXk0mBMWanIHfZxiuiBOyjgLpMVOJCdWGfX4Erqo0B2rL7bz5KxM6tyqIyWSd9VOck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779426132; c=relaxed/simple;
	bh=pQ5Z+do5dhn2bQj0dybUWEq0ET6QmYZM3J3sduNtcEg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=JsyuWWZfglmVQERMewY4//QPlRaB2bctekY4ZWtf0I3S4r7pZexjjOYG1r7NbjmTE0WEeRMXbVSfpMp9KF4SKMTfJGbn8eaBDT7Hzhts1209pG13bCWaJA0sbLMU6mJyFT94O1xdihTma9ttgg7n7NdBb1iamDe7zgmIc//yvo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b6S1gjBV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b6S1gjBV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779426129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vsNf0MvOrrWG4whkFFEDr0jIvGdgGzZa+U8JZWT2QcQ=;
	b=b6S1gjBVBJQVWUNwdksQ+grUzHLGkCsa5TBKZ7x9e7eCnChymSIvDzQ5KtLPbYjpQSZjJH
	l5ugRf8ROC4Vkqsg/zokGrNFNL25/gcyqsQZCt/Ba5pYL6gjR5qJsgk8zVe4QqC6CVMo37
	56OmckGHCy59hKWGez/PC03jF5TxrJI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-460-_gK0kBtpM9WOPlHZvgdwMA-1; Fri,
 22 May 2026 01:02:06 -0400
X-MC-Unique: _gK0kBtpM9WOPlHZvgdwMA-1
X-Mimecast-MFC-AGG-ID: _gK0kBtpM9WOPlHZvgdwMA_1779426125
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5914A19560B5
	for <llvm@lists.linux.dev>; Fri, 22 May 2026 05:02:05 +0000 (UTC)
Received: from [172.20.212.222] (unknown [10.30.45.124])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B84D21800591;
	Fri, 22 May 2026 05:02:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 2 of 88): Test report for master
 (7.1.0-rc4, upstream-mainline, 758c807b)
Date: Fri, 22 May 2026 05:02:04 -0000
To: yoyang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <48660.126052201020600485@us-mta-460.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PkLYhvfIluygvh2fMT3zYtEeS9zO02uu5ZV9iP_gcEc_1779426125
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'efi-fixes-for-v7.1-2' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/efi/efi

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2544244330

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2544244330_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2544244330_x86_64_kernel_kcidb_tool_21331866_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2544244330_x86_64_kernel_kcidb_tool_21331866_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check


Tests that were not ran because of internal issues:
    /distribution/command [aarch64]
    Reboot test [aarch64]


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

