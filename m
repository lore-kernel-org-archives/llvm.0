Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A00224F6
	for <llvm@lists.linux.dev>; Fri, 28 Mar 2025 02:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743129789; cv=none; b=OWzkipSF0SJv/hSNqVvvGbQI7HYeFd1pUIQcr9z7MdqeSYLuR/Cs3tkzqSdSNw/hvKBDKn9C+cPyZ/6B9iXUWBnAISU1ye9VsDflbPS/5bG5GjIqDzNqVKd87NKYQqXIJzUYIT6zbi/lUL+sKXF4HvkxrzT70ZqU2OAyYoOcfmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743129789; c=relaxed/simple;
	bh=QugrBsIJXlfZWwe0rBUAzjo0pe1z4ByCdKCWNU9OOq4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=BwUztEDK2CiUJnEYD/Wfo/jMLohVZ2YBpHYvM8po+fpC5A0zyBIFxMYtWsYr1VOhzryXgXCNf84sPG62IbcHOnneCbImrq4D5NCJRyLv/r2if1z9po7K1JLxSEX+zYsdsR16KvWqlcfkvbBovk71wxpOd60NSXYP3YAsXaKoHew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GTfFHycc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GTfFHycc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743129785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CpKKiGXmNIdKiyIbt77IF7k8ZmOPtsht4tjnvcGYv3o=;
	b=GTfFHyccpuRfBfkJWUfy6RrCyutnyYz1IrL66g+Ocxar7EeoLe1wd7Y2Ra+u/K2w3GHHYi
	ukneoEI3hUNPDhxjLYzgCbsoLxlz1ylOeqle9AEs2M5BRAbC7FVyGyAeBAK8ydqlRhbsfD
	v7KY0UQRux6ECnxVvE7tznm3QpH1S9c=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-527-IzIs34SgO6SYRlaRyBKGmg-1; Thu,
 27 Mar 2025 22:43:04 -0400
X-MC-Unique: IzIs34SgO6SYRlaRyBKGmg-1
X-Mimecast-MFC-AGG-ID: IzIs34SgO6SYRlaRyBKGmg_1743129783
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 360B3180025B
	for <llvm@lists.linux.dev>; Fri, 28 Mar 2025 02:43:03 +0000 (UTC)
Received: from [172.20.32.163] (unknown [10.30.44.171])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 93900180B48E;
	Fri, 28 Mar 2025 02:43:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0,
 upstream-mainline, 4fa118e5)
Date: Fri, 28 Mar 2025 02:43:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <20972.125032722430400238@us-mta-527.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZIcKveczQp2ZPYfYReoSTaeh_xl34h_zWQ2lYwVbcrM_1743129783
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'trace-tools-v6.15' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/trace/linux-trace

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1739356820

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1739356820-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1739356820-x86_64-kernel
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

