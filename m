Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC84A93D
	for <llvm@lists.linux.dev>; Tue, 25 Mar 2025 06:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742884989; cv=none; b=OrzeKtNd5D7bjqU6WVKZxX4wfW2gUMq4PLhnbkAWw1PSrYyWuZ+52yPuiQZ/XDNVqe0xHQM1hZfxx4fT4iWPG1rS9mvRp+C44vQAU93EDDyWHunjZP52Qog2ty4h5nO01KWczEmfJiPwsz2XwKVbF0hdPX7/moTH0Pi4VsB/ni8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742884989; c=relaxed/simple;
	bh=2R+quN3lBSZuhs/LuOXxb0SqbWDONZSjoMV2Q6MA62Y=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=QOBV220tloSpPXbJJDExfk6rNa4pJ+aS6/rNg5ZOxiVVnmiu2Uou5CsFJzr8zuDUQ3baRU6MxUF1844De8n5MoUE/b0sSJf87GW5lzZLWkszehkRNi3hWX4YdwHx4snAkoxCaWiVMq4pfGCiR5ObaM+tZVFjNotv0zW4QS0cGJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Eyeyb0uI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Eyeyb0uI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742884986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fVxl10GnF81FpZbglzeo0P4ooEZJUIwlXp6vzKyi/Vk=;
	b=Eyeyb0uIABgMAqXdIgWelBBlRQmouRj5aJpVuNWhZvyb68DzumsT9ObsmfpgvI67ChK0jp
	M3ZqZIp/VXX0Z57GmQZM4hlWBEWWSYB7XI2LmjC7MtqzMNruKNHI1jxTX7Qp0ypwfoX5ah
	U8jF3DAfKObntoT7QNWw3CsRJk6ou0c=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-253-4RB4c_9OMRqS2S4mcPnxew-1; Tue,
 25 Mar 2025 02:43:04 -0400
X-MC-Unique: 4RB4c_9OMRqS2S4mcPnxew-1
X-Mimecast-MFC-AGG-ID: 4RB4c_9OMRqS2S4mcPnxew_1742884984
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1952C18EBE8F
	for <llvm@lists.linux.dev>; Tue, 25 Mar 2025 06:43:04 +0000 (UTC)
Received: from [172.20.55.199] (unknown [10.30.45.42])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9CE7C30001A1;
	Tue, 25 Mar 2025 06:43:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0,
 upstream-mainline, 327ecdbc)
Date: Tue, 25 Mar 2025 06:43:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <37595.125032502430500145@us-mta-253.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iQjfGbdTkfHtb8xIWWnfbS2GMEbqPAvpC1WiR82HgXQ_1742884984
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'perf-core-2025-03-22' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1733409445

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1733409445-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1733409445-x86_64-kernel
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

