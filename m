Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33963398B
	for <llvm@lists.linux.dev>; Sat, 18 Jan 2025 22:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737240731; cv=none; b=VkFUrvUhGXMBr2cadESePSiv2TdW8PvAPjIWWHK4FQOJk2+jvC/Ts/ByWjN8iuBqNOeW+ZcWk5fV1V8SyQTs1vKee0JkPjO9YCbrXpCXTEWwzcwddHN6sAS3+dedRQt4Eerrkw8WucEw1wHw8l4ib9Rl4mz+BmBFBMvqxsWfZUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737240731; c=relaxed/simple;
	bh=PQSMKL6y6aMfCJwMwKK+NjxSNFWfcQ+Xr9a2zPv3XaU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Bay8h9GIJAYLTTRZ6sRDOBk6cTfat0cWluF12NsM2vLDfNkmx/swB7RqJvO3vcXFaGH5qsME7X6CI2hAGoeei7jyCNF+67AoGZVyIb984jtnJLadNQlBVM3zPNc5jZmOFWmhUMVHXUHJV0IbzjIo44LjN0RxT+pwOFauDP6Sfwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hoe6zaM1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hoe6zaM1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737240728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CMCaZeqXi7O6abXmLpogQKEb6lhDK+E+nosPKsmqNGo=;
	b=hoe6zaM1M0YEwBE7IsOlFbBfWDGKaHZ4Jv4bfNtHFzmhu2GjgBUCkXsTJXJYAoypHtIM+V
	eK4c8tyaNzDJVI5VyqbbZFvIirf5fkRVKKbIw9jqFFywO2Hl2QZpBe/eF6d8hzLYims8q6
	YyLbpcfyy9upPZCXZpp+pp4k7ol7bHI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-529-6GjOO725NeeoKbRskrUKAA-1; Sat,
 18 Jan 2025 17:52:06 -0500
X-MC-Unique: 6GjOO725NeeoKbRskrUKAA-1
X-Mimecast-MFC-AGG-ID: 6GjOO725NeeoKbRskrUKAA
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8BFE719560B7
	for <llvm@lists.linux.dev>; Sat, 18 Jan 2025 22:52:05 +0000 (UTC)
Received: from [172.64.12.20] (unknown [10.30.33.24])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E786C195608A;
	Sat, 18 Jan 2025 22:52:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc7,
 upstream-mainline, fda5e3f2)
Date: Sat, 18 Jan 2025 22:52:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <79409.125011817520600226@us-mta-529.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jhneSV-8w-ow_FuB8g-JW2zUc-70dEvbLJmPHm6LefI_1737240725
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'trace-v6.13-rc7-2' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/trace/linux-trace

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1631131134

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1631131134-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1631131134-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1631131134-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


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

