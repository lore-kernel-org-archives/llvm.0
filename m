Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DA326E6F8
	for <llvm@lists.linux.dev>; Tue, 19 Aug 2025 19:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755630732; cv=none; b=VjmO2l0/yXQLnF0Ejsk1te5RqFFRtITQ6QBP2hhPL/zTSnJEp4GryD4O7zNLnwF2EythmjoVP8nLolpOLfvW/oTk/uq0eyqlpyypqWs4ZWQ1pziE8X3JnSj0xH111jYIpU6iqNkyiwwG16Il6TMpway/05ipaZPdLeMo2vE0Pf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755630732; c=relaxed/simple;
	bh=LY3KKIvImKcmpJsaGTn43/38IgQ/c+/4+iW6uB/2BQ4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Ab6NnK7/QZZlHbKU1/ugHWNATLvpZgnXcNaZqDwp9E7ateSgXdKEnzw+r5QubLKZ1OHr0a4Sbq7/1izMNvuF6XpD+FvnvH0w768k4VaE0knq+sz71oEwiG37SEzbIBGFKqRV1OrO71CpKHsAd5/90OIcHpbEO3b0g8vvGeZ6vhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DqVNLTVD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DqVNLTVD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755630728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BT46fILS0jCE3JakeOAD6Ozl3PwA+ni2E2128MsO1mU=;
	b=DqVNLTVD3yGYjDvBP9P0V8tPQpPNJqybw+UTnZ6G6JCZ5MvKXGHSTpzcltahK8M7Jz24F6
	NbpqHczuGmxLuJxOuo8GwuiUvmOB3V5FrKieuc/iEA7GiC6dXPWPxMV9XN0ER7XQcYkGH3
	ut3E+YyRaxbk1m4R2JvjOTzmIkpkuVQ=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-654-0qHXEGJfMyOwyuF43lNkAw-1; Tue,
 19 Aug 2025 15:12:07 -0400
X-MC-Unique: 0qHXEGJfMyOwyuF43lNkAw-1
X-Mimecast-MFC-AGG-ID: 0qHXEGJfMyOwyuF43lNkAw_1755630726
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 722DD1955D6A
	for <llvm@lists.linux.dev>; Tue, 19 Aug 2025 19:12:06 +0000 (UTC)
Received: from [172.20.84.71] (unknown [10.30.45.119])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1B9DC1800280;
	Tue, 19 Aug 2025 19:12:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.17.0-rc2,
 upstream-mainline, b19a97d5)
Date: Tue, 19 Aug 2025 19:12:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <44361.125081915120701844@us-mta-654.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zJ0LQcIVAGnNIKH8EF0uTbH7TSbWPCrGKv-74u1zDZk_1755630726
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'pull-fixes' of git://git.kernel.org/pub/scm/=
linux/kernel/git/viro/vfs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1992143877

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1992143877_aarch64_kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1992143877_x86_64_kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1992143877_x86_64_kernel-debug


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

